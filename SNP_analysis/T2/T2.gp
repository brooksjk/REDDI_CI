set terminal png tiny size 800,800
set output "T2.png"
set size 1,1
set grid
unset key
set border 15
set tics scale 0
set xlabel "NC_045512.2"
set ylabel "117M18E3A55DA32BFR"
set format "%.0f"
set mouse format "%.0f"
set mouse mouseformat "[%.0f, %.0f]"
set xrange [1:29903]
set yrange [1:29903]
set style line 1  lt 1 lw 3 pt 6 ps 1
set style line 2  lt 3 lw 3 pt 6 ps 1
set style line 3  lt 2 lw 3 pt 6 ps 1
plot \
 "T2.fplot" title "FWD" w lp ls 1, \
 "T2.rplot" title "REV" w lp ls 2
