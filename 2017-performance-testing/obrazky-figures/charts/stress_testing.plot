set terminal pdf font 'CMU SERIF' size 6,4
#set size 1200,400
set output '../stress_testing.pdf'
set title 'Stress Testing' font ",16"
set grid

set xlabel 'Relative Time'
#set xdata time
set xrange [1511704800:1511758800]
set timefmt "%s"
set format x "%H:%M"
set xdata time
set xtics 7200 nomirror

set ylabel 'Request Count'
set yrange [0:4000]
set ytics 1000 nomirror

set y2label 'Response Time (seconds)'
set y2range [0:5]
set y2tics 1 nomirror
#set format y2 "%0.2f"

set style line 1 lt 2 lc rgb "#5DA5DA" lw 2 pt 7 ps 0.8
set style line 2 lt 2 lc rgb "#60BD68" lw 2 pt 7 ps 0.8

set style fill solid 0.2 border

# with linespoints - link with points

plot "stress_testing.dat" using 1:3 ls 2 title 'Load Size' with filledcurves x1 axes x1y1,\
     "stress_testing.dat" using 1:2 ls 1 title 'Response Time' with filledcurves x1 axes x1y2 fs transparent
