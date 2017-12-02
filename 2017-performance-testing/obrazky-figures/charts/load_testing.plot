set terminal pdf font 'CMU SERIF' size 6,3
#set size 1200,400
set output '../load_testing.pdf'
set title 'Load Testing' font ",16"
set grid

set xlabel 'Relative Time (HH:MM)'
#set xdata time
set xrange [0:10800]
set timefmt "%s"
set format x "%H:%M"
set xdata time
set xtics 900 nomirror

set ylabel 'Request Count'
set yrange [0:2500]
set ytics 500 nomirror

set y2label 'Time (seconds)'
set y2range [0:3.5]
set y2tics 0.5 nomirror
set format y2 "%0.2f"

set style line 1 lt 2 lc rgb "#5DA5DA" lw 2 pt 7 ps 0.8
set style line 2 lt 2 lc rgb "#60BD68" lw 2 pt 7 ps 0.8

set style fill solid 0.2 border

# with linespoints - link with points

plot "load_testing.dat" using 1:3 ls 2 title 'Request number' with filledcurves x1 axes x1y1,\
     "load_testing.dat" using 1:2 ls 1 title 'Load Size' with filledcurves x1 axes x1y2 fs transparent
