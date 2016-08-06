set terminal png
set output outdir."/neighbor_degree_correlation.png"
set logscale x
set format x "10^{%L}"
unset logscale y
set xlabel "k"
set ylabel "k_{nn}(k)"
plot indir."/neighbor_degree_correlation.dat" w lp

