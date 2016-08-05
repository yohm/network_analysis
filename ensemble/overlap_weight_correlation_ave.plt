set terminal png
set output "overlap_weight_correlation_ave.png"
set logscale x
unset logscale y
set xlabel "w"
set ylabel "O(w)"
plot "overlap_weight_correlation_ave.dat" u 1:2:3 w errorlines

