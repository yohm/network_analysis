set terminal png
set output outdir."/strength_distribution.png"
set logscale x
set logscale y
set format x "10^{%L}"
set format y "10^{%L}"
set xlabel "s"
set ylabel "frequency"
plot indir."/strength_distribution.dat" w lp

