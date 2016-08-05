set terminal png
set output "edge_weight_distribution_ave.png"
set logscale x
set logscale y
set xlabel "w_{ij}"
set ylabel "frequency"
plot "edge_weight_distribution_ave.dat" u 1:2:3 w errorlines

