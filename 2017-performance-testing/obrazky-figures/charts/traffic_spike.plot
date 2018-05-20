set terminal pdf font 'CMU SERIF' size 6,3
#set terminal postscript eps font 'Roman' color size 9,3
#set size 1200,400
set output '../traffic_spike.pdf'
set title 'Traffic Spike' font ",16"
set grid

set xlabel 'Relative Time [HH:MM]'
#set xdata time
set xrange [0:37800]
set timefmt "%s"
set format x "%H:%M"
set xdata time
set xtics 3600 nomirror

set ylabel 'Request Count [RPS]'
set yrange [0:3500]
set ytics 500 nomirror

set style line 1 lt 2 lc rgb "#c5e3df" lw 2 pt 7 ps 0.8
set style line 2 lt 9 lc rgb "#DC143C" lw 2 pt 7 ps 0.8
set style line 3 lt 9 lc rgb "#5DA5DA" lw 2 pt 7 ps 0.8
set style line 4 lt 9 lc rgb "#60BD68" lw 2 pt 7 ps 0.8
set style line 5 lt 9 lc rgb "#FFD700" lw 2 pt 7 ps 0.8


set style data filledcurves

#set style fill solid 1 border lc '#5DA5DA'

# with linespoints - link with points

plot "traffic_spike.dat" using 1:2 ls 4 title 'Request Count' with filledcurves x1 fs solid 0.2 transparent,\
     "traffic_spike.dat" using 1:3 ls 5 title 'Spike'  with boxes fs solid 0.15 noborder transparent
