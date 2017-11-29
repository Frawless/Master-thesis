set terminal pdf font 'CMU SERIF' size 6,3
#set terminal postscript eps font 'Roman' color size 9,3
#set size 1200,400
set output '../latency.pdf'
set title 'Latency' font ",16"
set grid

set xlabel 'Relative Time'
#set xdata time
set xrange [1511704800:1513368000]
set timefmt "%s"
set format x "%b %d"
set xdata time
set xtics 172800 nomirror

set ylabel 'Latency'
set yrange [0:5]
set ytics 0.5 nomirror

set style line 1 lt 2 lc rgb "#c5e3df" lw 2 pt 7 ps 0.8
set style line 2 lt 9 lc rgb "#DC143C" lw 2 pt 7 ps 0.8

set style data filledcurves

set style fill solid 1 border lc '#5DA5DA'

# with linespoints - link with points

plot "latency.dat" using 1:2 ls 1 title 'Latency' with filledcurves x1
