from __future__ import annotations

import csv
import re
from pathlib import Path

import matplotlib.pyplot as plt


def parse_frequency(freq_text: str) -> float:
	text = freq_text.strip().lower()
	if text.endswith("hz"):
		text = text[:-2].strip()

	# Handle labels like "f_{0} = 934.00" by extracting the numeric part.
	if "=" in text:
		text = text.split("=", 1)[1].strip()
	text = text.replace(",", "")
	match = re.search(r"[-+]?\d*\.?\d+(?:[eE][-+]?\d+)?", text)
	if match:
		text = match.group(0)

	unit_scale = 1.0
	if text.endswith("k"):
		unit_scale = 1e3
		text = text[:-1]
	elif text.endswith("m"):
		unit_scale = 1e6
		text = text[:-1]

	return float(text) * unit_scale


def main() -> None:
	script_dir = Path(__file__).resolve().parent
	input_csv = script_dir / "E1.csv"
	output_amp_png = script_dir / "amplitude_frequency.png"
	output_phase_png = script_dir / "phase_frequency.png"

	rows: list[dict[str, float]] = []

	with input_csv.open("r", encoding="utf-8", newline="") as f:
		reader = csv.DictReader(f)
		fieldnames = reader.fieldnames or []
		phase_key = next(
			(
				name
				for name in fieldnames
				if "rad" in name.lower() and ("phi" in name.lower() or "\u03c6" in name.lower())
			),
			None,
		)
		if phase_key is None:
			raise KeyError(f"Cannot find phase column in CSV header: {fieldnames}")

		for row in reader:
			freq_hz = parse_frequency(row["f/Hz"])
			vopp_mv = float(row["v_{opp}/mV"])
			phase_rad = float(row[phase_key])
			rows.append(
				{
					"f_hz": freq_hz,
					"vopp_mv": vopp_mv,
					"phase_rad": phase_rad,
				}
			)

	rows.sort(key=lambda x: x["f_hz"])

	freqs = [r["f_hz"] for r in rows]
	vopps = [r["vopp_mv"] for r in rows]
	phases = [r["phase_rad"] for r in rows]

	plt.figure(figsize=(8, 5), dpi=140)
	plt.semilogx(freqs, vopps, marker="o", linewidth=1.8, markersize=4.8, color="tab:blue")
	plt.xlabel("Frequency (Hz)")
	plt.ylabel("Output Amplitude (mV)")
	plt.title("Amplitude-Frequency Characteristic")
	plt.grid(True, which="both", linestyle=":", linewidth=0.8, alpha=0.8)
	plt.tight_layout()
	plt.savefig(output_amp_png)
	plt.close()

	plt.figure(figsize=(8, 5), dpi=140)
	plt.semilogx(freqs, phases, marker="o", linewidth=1.8, markersize=4.8, color="tab:orange")
	plt.xlabel("Frequency (Hz)")
	plt.ylabel("Phase Difference (rad)")
	plt.title("Phase-Frequency Characteristic")
	plt.grid(True, which="both", linestyle=":", linewidth=0.8, alpha=0.8)
	plt.tight_layout()
	plt.savefig(output_phase_png)
	plt.close()

	print(f"Saved amplitude-frequency plot: {output_amp_png}")
	print(f"Saved phase-frequency plot: {output_phase_png}")


if __name__ == "__main__":
	main()
