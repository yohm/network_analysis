set terminal png
set output outdir."/degree_distribution.png"
unset logscale x
set logscale y
set xlabel "degree"
set ylabel "frequency"
unset key
plot indir."/degree_distribution.dat" w lp

