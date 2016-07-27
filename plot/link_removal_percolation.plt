set terminal png
set output outdir."/link_removal_percolation.png"
unset logscale x
unset logscale y
set xlabel "f"
set ylabel "R_{LCC}"
set y2tics
set y2label "Susceptibility"
set style data lp
p indir."/link_removal_percolation.dat" u 1:2 axis x1y1 title "weak link removal", "" u 1:3 axis x1y2 title "weak link removal suscept.", "" u 1:4 axis x1y1 title "strong link removal", "" u 1:5 axis x1y2 title "strong link removal suscept."

