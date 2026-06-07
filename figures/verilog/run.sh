#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
iverilog -g2012 -o decimal_counter_tb.out decimal_counter.v tb_decimal_counter.v
vvp decimal_counter_tb.out
