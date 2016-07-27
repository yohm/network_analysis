set terminal png
set output outdir."/edge_weight_distribution.png"
set logscale x
set logscale y
set xlabel "w_{ij}"
set ylabel "frequency"
unset key
plot indir."/edge_weight_distribution.dat" w lp

