from __future__ import annotations

import csv
import re
from pathlib import Path

import matplotlib.pyplot as plt


def parse_float(text: str) -> float:
	match = re.search(r"[-+]?\d*\.?\d+(?:[eE][-+]?\d+)?", text.strip())
	if not match:
		raise ValueError(f"Cannot parse numeric value from: {text!r}")
	return float(match.group(0))


def normalize_header(name: str) -> str:
	return re.sub(r"[^a-z0-9]", "", name.lower())


def safe_filename(name: str) -> str:
	clean = re.sub(r"[^a-zA-Z0-9_\-]+", "_", name).strip("_")
	return clean or "curve"


def main() -> None:
	script_dir = Path(__file__).resolve().parent
	input_csv = script_dir / "E2.csv"

	rows: list[dict[str, str]] = []

	with input_csv.open("r", encoding="utf-8", newline="") as f:
		reader = csv.DictReader(f)
		fieldnames = reader.fieldnames or []
		if not fieldnames:
			raise ValueError("CSV has no header row")

		normalized_map = {name: normalize_header(name) for name in fieldnames}
		input_key = next(
			(name for name in fieldnames if normalized_map[name] in {"vi", "v_i", "v{i}"}),
			None,
		)
		if input_key is None:
			input_key = next(
				(name for name in fieldnames if "vi" in normalized_map[name] or normalized_map[name].endswith("i")),
				None,
			)
		if input_key is None:
			raise KeyError(f"Cannot find input column (V_i) in CSV header: {fieldnames}")

		output_keys = [name for name in fieldnames if name != input_key]
		if len(output_keys) != 3:
			raise ValueError(
				f"Expected 3 output columns for transfer curves, got {len(output_keys)}: {output_keys}"
			)

		for row in reader:
			if not row:
				continue
			rows.append(row)

	rows.sort(key=lambda r: parse_float(r[input_key]))
	x_vals = [parse_float(r[input_key]) for r in rows]

	for index, out_key in enumerate(output_keys, start=1):
		y_vals = [parse_float(r[out_key]) for r in rows]
		output_png = script_dir / f"transfer_{index}_{safe_filename(out_key)}.png"

		plt.figure(figsize=(8, 5), dpi=140)
		plt.plot(x_vals, y_vals, marker="o", linewidth=1.8, markersize=4.8, color="tab:blue")
		plt.xlabel(input_key)
		plt.ylabel(out_key)
		plt.title(f"Transfer Characteristic: {out_key} vs {input_key}")
		plt.grid(True, linestyle=":", linewidth=0.8, alpha=0.8)
		plt.tight_layout()
		plt.savefig(output_png)
		plt.close()

		print(f"Saved transfer characteristic plot: {output_png}")


if __name__ == "__main__":
	main()
