#!/bin/bash
set -eux

INPUT_DIR=$1
OUTPUT_DIR=${2:-.}
mkdir -p $OUTPUT_DIR
script_dir=$(cd $(dirname $BASH_SOURCE); pwd)

topology_plt_files=(
cc_degree_correlation.plt
degree_distribution.plt
neighbor_degree_correlation.plt
)

for pltfile in ${topology_plt_files[@]}; do
  gnuplot -e "indir='$INPUT_DIR'; outdir='$OUTPUT_DIR'" ${script_dir}/${pltfile}
done

if [ -e $INPUT_DIR/edge_weight_distribution.dat ]; then
weight_plt_files=(
edge_weight_distribution.plt
link_removal_percolation.plt
link_removal_percolation_scale.plt
overlap_weight_correlation.plt
strength_degree_correlation.plt
strength_distribution.plt
)

ensemble_average_rb=$script_dir/../ensemble/ensemble_averaging/ensemble_averaging.rb

ruby ${ensemble_average_rb} -l -f $INPUT_DIR/edge_weight_distribution.dat -o $INPUT_DIR/edge_weight_distribution_logbin.dat
ruby ${ensemble_average_rb} -l $INPUT_DIR/overlap_weight_correlation.dat -o $INPUT_DIR/overlap_weight_correlation_logbin.dat
ruby ${ensemble_average_rb} -l -f $INPUT_DIR/strength_distribution.dat -o $INPUT_DIR/strength_distribution_logbin.dat
for pltfile in ${weight_plt_files[@]}; do
  gnuplot -e "indir='$INPUT_DIR'; outdir='$OUTPUT_DIR'" ${script_dir}/${pltfile}
done

fi

