set terminal png
set output outdir."/overlap_weight_correlation.png"
set logscale x
unset logscale y
set xlabel "w"
set ylabel "O(w)"
plot indir."/overlap_weight_correlation.dat" w lp
