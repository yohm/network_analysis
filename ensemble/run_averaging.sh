#!/bin/bash
set -eux

# Usage:
#   ./run_averaging.sh '_input/*' .
#
# The first argument indicates the directories containing input files.
# It specifies the patten of input directories, like 'data/*'.
# Make sure that the first argument is surrounded by single quotes, otherwise the argument is expanded by the shell.
#
# The second argument specifies the output directory. It is an optional argument and its default value is '.'.
#
PATTERN=$1
OUT_DIR=${2:-.}  # default output directory is the current directory
script_dir=$(cd $(dirname $BASH_SOURCE); pwd)

mkdir -p $OUT_DIR
cd $OUT_DIR

ls $PATTERN/cc_degree_correlation.dat       | xargs ruby $script_dir/ensemble_averaging/ensemble_averaging.rb    > cc_degree_correlation_ave.dat
ls $PATTERN/degree_distribution.dat         | xargs ruby $script_dir/ensemble_averaging/ensemble_averaging.rb -f > degree_distribution_ave.dat
ls $PATTERN/edge_weight_distribution.dat    | xargs ruby $script_dir/ensemble_averaging/ensemble_averaging.rb -f > edge_weight_distribution_ave.dat
ls $PATTERN//link_removal_percolation.dat   | xargs ruby $script_dir/ensemble_averaging/ensemble_averaging.rb -b 0.002 > link_removal_percolation_ave.dat
ls $PATTERN/neighbor_degree_correlation.dat | xargs ruby $script_dir/ensemble_averaging/ensemble_averaging.rb    > neighbor_degree_correlation_ave.dat
ls $PATTERN/overlap_weight_correlation.dat  | xargs ruby $script_dir/ensemble_averaging/ensemble_averaging.rb    > overlap_weight_correlation_ave.dat
ls $PATTERN/strength_degree_correlation.dat | xargs ruby $script_dir/ensemble_averaging/ensemble_averaging.rb    > strength_degree_correlation_ave.dat
ls $PATTERN/strength_distribution.dat       | xargs ruby $script_dir/ensemble_averaging/ensemble_averaging.rb -f > strength_distribution_ave.dat

find $script_dir -name "*.plt" | xargs -n 1 -t gnuplot

