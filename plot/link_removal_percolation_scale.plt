set terminal png
set output outdir."/link_removal_percolation_scale.png"
unset logscale x
unset logscale y
set xlabel "(1-f)k"
set ylabel "R_{LCC}"
set y2tics
set y2label "Susceptibility"
set style data lp
set xrange[0:10]
p indir."/link_removal_percolation.dat" u 6:2 axis x1y1 title "weak link removal", "" u 6:3 axis x1y2 title "weak link removal suscept.", "" u 6:4 axis x1y1 title "strong link removal", "" u 6:5 axis x1y2 title "strong link removal suscept."

