#!/usr/bin/env python3
from __future__ import annotations

import math
import struct
import zlib
from pathlib import Path


W, H = 440, 780
BG = (0, 0, 0)
GRID_MAJOR = (34, 54, 58)
GRID_MINOR = (18, 28, 30)
GRID_AXIS = (40, 120, 130)
CYAN = (0, 245, 255)
YELLOW = (255, 232, 0)
WHITE = (255, 255, 255)


FONT_5X7 = {
    "0": [" ### ", "#   #", "#  ##", "# # #", "##  #", "#   #", " ### "],
    "1": ["  #  ", " ##  ", "# #  ", "  #  ", "  #  ", "  #  ", "#####"],
    "2": [" ### ", "#   #", "    #", "   # ", "  #  ", " #   ", "#####"],
    "3": [" ### ", "#   #", "    #", " ### ", "    #", "#   #", " ### "],
    "4": ["   # ", "  ## ", " # # ", "#  # ", "#####", "   # ", "   # "],
    "5": ["#####", "#    ", "#    ", "#### ", "    #", "#   #", " ### "],
    "6": [" ### ", "#   #", "#    ", "#### ", "#   #", "#   #", " ### "],
    "7": ["#####", "    #", "   # ", "  #  ", " #   ", " #   ", " #   "],
    "8": [" ### ", "#   #", "#   #", " ### ", "#   #", "#   #", " ### "],
    "9": [" ### ", "#   #", "#   #", " ####", "    #", "#   #", " ### "],
    "C": [" ### ", "#   #", "#    ", "#    ", "#    ", "#   #", " ### "],
    "K": ["#   #", "#  # ", "# #  ", "##   ", "# #  ", "#  # ", "#   #"],
    "L": ["#    ", "#    ", "#    ", "#    ", "#    ", "#    ", "#####"],
    "Q": [" ### ", "#   #", "#   #", "#   #", "# # #", "#  # ", " ## #"],
    "Y": ["#   #", " # # ", "  #  ", "  #  ", "  #  ", "  #  ", "  #  "],
}


def build_signals(periods: int = 8):
    # state sequence: 00 -> 01 -> 10 -> 11 -> ...
    values = list(range(periods + 1))
    states = [i % 4 for i in values]
    q0 = [s & 1 for s in states]
    q1 = [(s >> 1) & 1 for s in states]
    y0 = [0 if s == 0 else 1 for s in states]
    y1 = [0 if s == 1 else 1 for s in states]
    y2 = [0 if s == 2 else 1 for s in states]
    y3 = [0 if s == 3 else 1 for s in states]

    # clock at 2x state rate, sampled every half-period
    clk_t = [i * 0.5 for i in range(periods * 2 + 1)]
    clk = [i % 2 for i in range(len(clk_t))]

    return {
        "CLK": (clk_t, clk),
        "Q0": (values, q0),
        "Q1": (values, q1),
        "Y0": (values, y0),
        "Y1": (values, y1),
        "Y2": (values, y2),
        "Y3": (values, y3),
    }


def make_canvas(w: int, h: int):
    return bytearray([0, 0, 0] * w * h)


def idx(x: int, y: int) -> int:
    return (y * W + x) * 3


def put(px: bytearray, x: int, y: int, c):
    if 0 <= x < W and 0 <= y < H:
        i = idx(x, y)
        px[i : i + 3] = bytes(c)


def rect(px, x0, y0, x1, y1, c):
    x0 = max(0, min(W - 1, x0))
    x1 = max(0, min(W - 1, x1))
    y0 = max(0, min(H - 1, y0))
    y1 = max(0, min(H - 1, y1))
    for y in range(y0, y1 + 1):
        base = idx(x0, y)
        row = bytes(c) * (x1 - x0 + 1)
        px[base : base + len(row)] = row


def hline(px, x0, x1, y, c, t=1):
    if x1 < x0:
        x0, x1 = x1, x0
    for dy in range(-(t // 2), t - t // 2):
        yy = y + dy
        if 0 <= yy < H:
            rect(px, x0, yy, x1, yy, c)


def vline(px, x, y0, y1, c, t=1):
    if y1 < y0:
        y0, y1 = y1, y0
    for dx in range(-(t // 2), t - t // 2):
        xx = x + dx
        if 0 <= xx < W:
            rect(px, xx, y0, xx, y1, c)


def draw_axis_line(px, p1, p2, c, t=1):
    x1, y1 = p1
    x2, y2 = p2
    if y1 == y2:
        hline(px, x1, x2, y1, c, t=t)
    elif x1 == x2:
        vline(px, x1, y1, y2, c, t=t)
    else:
        # fallback Bresenham
        dx = abs(x2 - x1)
        dy = -abs(y2 - y1)
        sx = 1 if x1 < x2 else -1
        sy = 1 if y1 < y2 else -1
        err = dx + dy
        x, y = x1, y1
        while True:
            rect(px, x - t // 2, y - t // 2, x + (t - 1) // 2, y + (t - 1) // 2, c)
            if x == x2 and y == y2:
                break
            e2 = 2 * err
            if e2 >= dy:
                err += dy
                x += sx
            if e2 <= dx:
                err += dx
                y += sy


def draw_polyline(px, points, c, t=3):
    for a, b in zip(points, points[1:]):
        draw_axis_line(px, a, b, c, t=t)


def draw_char(px, x, y, ch, c, scale=4):
    glyph = FONT_5X7.get(ch.upper())
    if not glyph:
        return x + 4 * scale
    for row, line in enumerate(glyph):
        for col, bit in enumerate(line):
            if bit != " ":
                rect(
                    px,
                    x + col * scale,
                    y + row * scale,
                    x + col * scale + scale - 1,
                    y + row * scale + scale - 1,
                    c,
                )
    return x + (len(glyph[0]) + 1) * scale


def draw_text(px, x, y, text, c, scale=4):
    cx = x
    for ch in text:
        if ch == " ":
            cx += 3 * scale
            continue
        cx = draw_char(px, cx, y, ch, c, scale=scale)


def step_points(times, vals, x0, y_mid, x_scale, y_low, y_high):
    pts = []
    y = y_high if vals[0] else y_low
    pts.append((int(round(x0 + times[0] * x_scale)), int(round(y_mid + y))))
    for i in range(len(vals) - 1):
        x = int(round(x0 + times[i + 1] * x_scale))
        pts.append((x, int(round(y_mid + y))))
        new_y = y_high if vals[i + 1] else y_low
        if new_y != y:
            pts.append((x, int(round(y_mid + new_y))))
            y = new_y
    return pts


def save_png(path: Path, px: bytearray, w: int, h: int):
    raw = bytearray()
    stride = w * 3
    for y in range(h):
        raw.append(0)
        raw.extend(px[y * stride : (y + 1) * stride])
    comp = zlib.compress(bytes(raw), level=9)

    def chunk(tag: bytes, data: bytes) -> bytes:
        return struct.pack(">I", len(data)) + tag + data + struct.pack(">I", zlib.crc32(tag + data) & 0xFFFFFFFF)

    ihdr = struct.pack(">IIBBBBB", w, h, 8, 2, 0, 0, 0)
    png = b"\x89PNG\r\n\x1a\n" + chunk(b"IHDR", ihdr) + chunk(b"IDAT", comp) + chunk(b"IEND", b"")
    path.write_bytes(png)


def main():
    out = Path("figures/datas/E1/image7_waveform_replot.png")
    signals = build_signals(periods=8)

    px = make_canvas(W, H)
    # background
    for y in range(H):
        for x in range(W):
            put(px, x, y, BG)

    left, right, top, bottom = 70, 18, 20, 20
    plot_w = W - left - right
    plot_h = H - top - bottom
    names = ["CLK", "Q0", "Q1", "Y0", "Y1", "Y2", "Y3"]
    row_h = plot_h / len(names)
    t_max = 8.0
    x_scale = plot_w / t_max

    # grid
    major_step = 1.0
    minor_step = 0.5
    for i in range(int(t_max / minor_step) + 1):
        x = int(round(left + i * minor_step * x_scale))
        c = GRID_MAJOR if i % 2 == 0 else GRID_MINOR
        t = 1 if i % 2 == 0 else 1
        vline(px, x, top, H - bottom, c, t=t)
    for i in range(len(names) + 1):
        y = int(round(top + i * row_h))
        hline(px, left, W - right, y, GRID_MAJOR, t=1)

    # border
    rect(px, left, top, W - right, H - bottom, (0, 0, 0))
    # re-draw border lines on top
    vline(px, left, top, H - bottom, GRID_AXIS, t=1)
    vline(px, W - right, top, H - bottom, GRID_AXIS, t=1)
    hline(px, left, W - right, top, GRID_AXIS, t=1)
    hline(px, left, W - right, H - bottom, GRID_AXIS, t=1)

    for i, name in enumerate(names):
        t, vals = signals[name]
        row_top = top + i * row_h
        # Signal vertical positions inside each lane
        low = row_h * 0.72
        high = row_h * 0.28
        pts = step_points(t, vals, left, row_top, x_scale, low, high)
        color = YELLOW if name == "Q1" else CYAN
        draw_polyline(px, pts, color, t=3)
        draw_text(px, 10, int(round(row_top + row_h / 2 - 16)), name, WHITE, scale=4)

    save_png(out, px, W, H)
    print(f"Saved: {out}")


if __name__ == "__main__":
    main()

