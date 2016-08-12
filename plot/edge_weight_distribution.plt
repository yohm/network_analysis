set terminal png
set output outdir."/edge_weight_distribution.png"
set logscale x
set logscale y
set format x "10^{%L}"
set format y "10^{%L}"
set xlabel "w_{ij}"
set ylabel "frequency"
unset key
plot indir."/edge_weight_distribution_logbin.dat" w lp

