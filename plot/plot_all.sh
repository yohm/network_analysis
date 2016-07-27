#!/bin/bash
set -eux

INPUT_DIR=$1
OUTPUT_DIR=$INPUT_DIR
mkdir -p $OUTPUT_DIR
find . -name "*.plt" | xargs -n 1 -t gnuplot -e "indir='$INPUT_DIR'; outdir='$OUTPUT_DIR'"

