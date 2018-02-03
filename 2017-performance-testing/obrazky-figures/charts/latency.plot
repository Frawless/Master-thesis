set terminal pdf font 'CMU SERIF' size 6,3
#set terminal postscript eps font 'Roman' color size 9,3
#set size 1200,400
set output '../latency.pdf'
set title 'Service Time vs. Latency' font ",16"
set grid

set xlabel 'Relative Time [HH:MM]'
#set xdata time
set xrange [0:54000]
set timefmt "%s"
set format x "%H:%M"
set xdata time
set xtics 7200 nomirror

set ylabel 'Time [ms]'
set yrange [0:12]
set ytics 2 nomirror

set style line 1 lt 9 lc rgb "#FFD700" lw 2 pt 7 ps 0.8
set style line 2 lt 9 lc rgb "#5DA5DA" lw 2 pt 7 ps 0.8
set style line 3 lt 9 lc rgb "#60BD68" lw 2 pt 7 ps 0.8

set style data filledcurves

# with linespoints - link with points

plot "latency.dat" using 1:4 ls 3 title 'Response Time' with filledcurves x1 fs solid 0.2 transparent,\
     "latency.dat" using 1:3 ls 2 title 'Latency' with filledcurves x1 fs solid 0.2 transparent, \
     "latency.dat" using 1:2 ls 1 title 'Service Time' with filledcurves x1 fs solid 0.2 transparent
