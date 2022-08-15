#!/bin/bash
set -eux

NET_FILE=$(cd $(dirname $1) && pwd)/$(basename $1)
OUT_DIR=${2:-.}  # default output dir is the current directory
script_dir=$(cd $(dirname $BASH_SOURCE); pwd)
export PIPENV_PIPFILE=${script_dir}/Pipfile

mkdir -p $OUT_DIR
cd $OUT_DIR
$script_dir/analyzer.out $NET_FILE
$script_dir/infomap/Infomap $NET_FILE . -i link-list -z -2 --overlapping --clu --out-name community
pipenv run python $script_dir/parse_clu.py community.clu > community_stat.json
pipenv run python $script_dir/egonet_community.py $NET_FILE > num_egocoms.json
$script_dir/egonet_com.out $NET_FILE > num_egocoms.json
#python $script_dir/egonet_community.py $NET_FILE > num_egocoms.json
pipenv run python $script_dir/merge_json.py _output.json community_stat.json num_egocoms.json > merged.json
mv merged.json _output.json 
rm community_stat.json num_egocoms.json

