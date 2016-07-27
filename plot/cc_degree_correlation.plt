set terminal png
set output outdir."/cc_degree_correlation.png"
set logscale
set xlabel "k"
set ylabel "c(k)"
unset key
plot indir."/cc_degree_correlation.dat" w p

