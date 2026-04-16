from __future__ import annotations

import csv
import math
from pathlib import Path

import matplotlib.pyplot as plt


def parse_frequency(freq_text: str) -> float:
	text = freq_text.strip().lower()
	if text.endswith("hz"):
		text = text[:-2].strip()

	unit_scale = 1.0
	if text.endswith("k"):
		unit_scale = 1e3
		text = text[:-1]
	elif text.endswith("m"):
		unit_scale = 1e6
		text = text[:-1]

	return float(text) * unit_scale


def interpolate_cutoff(p1: tuple[float, float], p2: tuple[float, float], target: float) -> float:
	f1, g1 = p1
	f2, g2 = p2
	if g1 == g2:
		return f1
	ratio = (target - g1) / (g2 - g1)
	return f1 + ratio * (f2 - f1)


def main() -> None:
	script_dir = Path(__file__).resolve().parent
	input_csv = script_dir / "bw.csv"
	output_csv = script_dir / "bw_sorted_with_av.csv"
	output_png = script_dir / "gain_frequency_bw.png"

	rows: list[dict[str, float]] = []

	with input_csv.open("r", encoding="utf-8", newline="") as f:
		reader = csv.DictReader(f)
		for row in reader:
			freq_hz = parse_frequency(row["f/Hz"])
			vipp_mv = float(row["v_{ipp}/mV"])
			vopp_v = float(row["v_{opp}/V"])
			av = vopp_v / (vipp_mv * 1e-3)
			rows.append(
				{
					"f_hz": freq_hz,
					"vipp_mv": vipp_mv,
					"vopp_v": vopp_v,
					"av": av,
				}
			)

	rows.sort(key=lambda x: x["f_hz"])

	gains = [r["av"] for r in rows]
	freqs = [r["f_hz"] for r in rows]

	av_max = max(gains)
	av_3db = av_max / math.sqrt(2.0)

	low_cutoff = None
	high_cutoff = None

	for i in range(len(rows) - 1):
		p1 = (rows[i]["f_hz"], rows[i]["av"])
		p2 = (rows[i + 1]["f_hz"], rows[i + 1]["av"])
		if p1[1] < av_3db <= p2[1]:
			low_cutoff = interpolate_cutoff(p1, p2, av_3db)
			break

	for i in range(len(rows) - 1, 0, -1):
		p1 = (rows[i - 1]["f_hz"], rows[i - 1]["av"])
		p2 = (rows[i]["f_hz"], rows[i]["av"])
		if p1[1] >= av_3db > p2[1]:
			high_cutoff = interpolate_cutoff(p1, p2, av_3db)
			break

	with output_csv.open("w", encoding="utf-8", newline="") as f:
		writer = csv.writer(f)
		writer.writerow(["f(Hz)", "vipp(mV)", "vopp(V)", "Av"])
		for r in rows:
			writer.writerow([f"{r['f_hz']:.6g}", f"{r['vipp_mv']:.6g}", f"{r['vopp_v']:.6g}", f"{r['av']:.6f}"])

	plt.figure(figsize=(8, 5), dpi=140)
	plt.semilogx(freqs, gains, marker="o", linewidth=1.8, markersize=4.8, label="Measured Gain")
	plt.axhline(av_3db, color="tab:red", linestyle="--", linewidth=1.3, label="-3 dB Level")

	if low_cutoff is not None:
		plt.axvline(low_cutoff, color="tab:green", linestyle="--", linewidth=1.2, label=f"fL = {low_cutoff:.2f} Hz")
	if high_cutoff is not None:
		plt.axvline(high_cutoff, color="tab:orange", linestyle="--", linewidth=1.2, label=f"fH = {high_cutoff:.2f} Hz")
	if low_cutoff is not None and high_cutoff is not None and high_cutoff > low_cutoff:
		plt.axvspan(low_cutoff, high_cutoff, color="tab:blue", alpha=0.12, label="Bandwidth")

	plt.xlabel("Frequency (Hz)")
	plt.ylabel("Voltage Gain Av")
	plt.title("Gain-Frequency Response")
	plt.grid(True, which="both", linestyle=":", linewidth=0.8, alpha=0.8)
	plt.legend()
	plt.tight_layout()
	plt.savefig(output_png)

	print(f"Saved sorted data: {output_csv}")
	print(f"Saved plot: {output_png}")
	print(f"Av(max) = {av_max:.6f}")
	print(f"Av(-3dB) = {av_3db:.6f}")
	print(f"fL = {low_cutoff:.6f} Hz" if low_cutoff is not None else "fL not found")
	print(f"fH = {high_cutoff:.6f} Hz" if high_cutoff is not None else "fH not found")


if __name__ == "__main__":
	main()
