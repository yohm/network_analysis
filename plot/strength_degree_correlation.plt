set terminal png
set output outdir."/strength_degree_correlation.png"
set logscale x
set logscale y
set xlabel "k"
set ylabel "s(k)"
plot indir."/strength_degree_correlation.dat" w lp

