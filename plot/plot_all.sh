#!/bin/bash
set -eux

INPUT_DIR=$1
OUTPUT_DIR=${2:-.}
mkdir -p $OUTPUT_DIR
script_dir=$(cd $(dirname $BASH_SOURCE); pwd)
ruby $script_dir/../ensemble/ensemble_averaging/ensemble_averaging.rb -l -f $INPUT_DIR/edge_weight_distribution.dat -o $INPUT_DIR/edge_weight_distribution_logbin.dat
ruby $script_dir/../ensemble/ensemble_averaging/ensemble_averaging.rb -l $INPUT_DIR/overlap_weight_correlation.dat -o $INPUT_DIR/overlap_weight_correlation_logbin.dat
ruby $script_dir/../ensemble/ensemble_averaging/ensemble_averaging.rb -l -f $INPUT_DIR/strength_distribution.dat -o $INPUT_DIR/strength_distribution_logbin.dat
find $script_dir -name "*.plt" | xargs -n 1 -t gnuplot -e "indir='$INPUT_DIR'; outdir='$OUTPUT_DIR'"


