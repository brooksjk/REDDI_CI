set terminal png tiny size 800,800
set output "T1.png"
set size 1,1
set grid
unset key
set border 15
set tics scale 0
set xlabel "NC_045512.2"
set ylabel "117M18E37DBC9AD1KM"
set format "%.0f"
set mouse format "%.0f"
set mouse mouseformat "[%.0f, %.0f]"
set xrange [1:29903]
set yrange [1:29902]
set style line 1  lt 1 lw 3 pt 6 ps 1
set style line 2  lt 3 lw 3 pt 6 ps 1
set style line 3  lt 2 lw 3 pt 6 ps 1
plot \
 "T1.fplot" title "FWD" w lp ls 1, \
 "T1.rplot" title "REV" w lp ls 2
