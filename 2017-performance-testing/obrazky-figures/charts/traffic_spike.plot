set terminal pdf size 12,4
#set size 1200,400
set output 'traffic_spike.pdf'
set title 'Traffic Spike' font ",16"
set grid

set xlabel 'Date'
#set xdata time
set xrange [1509494400:1511308800]
set timefmt "%s"
set format x "%b %d"
set xdata time
set xtics 86400 nomirror

set ylabel 'Sessions count'
set yrange [0:3500]
set ytics 500 nomirror

set style line 1 lt 2 lc rgb "#5DA5DA" lw 4 pt 7 ps 0.8
set style line 2 lt 2 lc rgb "#DC143C" lw 4 pt 7 ps 0.8

set style fill solid 0.2 border

# with linespoints - link with points

plot "traffic_spike.dat" using 1:3 ls 2 title 'Spike' with filledcurves x1 axes x1y1,\
     "traffic_spike.dat" using 1:2 ls 1 title 'Traffic' with filledcurves x1 axes x1y1
