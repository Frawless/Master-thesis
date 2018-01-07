set terminal pdf font 'CMU SERIF' size 6,4
#set size 1200,400
set output '../soak_testing.pdf'
set title 'Soak Testing' font ",16"
set grid

set xlabel 'Time [Days]'
#set xdata time
set xrange [1511704800:1513087200]
set timefmt "%s"
set format x "%b %d"
set xdata time
set xtics 172800 nomirror

set ylabel 'Requests Count [RPS]'
set yrange [0:2500]
set ytics 500 nomirror

set y2label 'Allocated Units [GB]'
set y2range [0:13000]
set y2tics 1500 nomirror
#set format y2 "%0.2f"

set style line 1 lt 2 lc rgb "#5DA5DA" lw 2 pt 7 ps 0.8
set style line 2 lt 2 lc rgb "#60BD68" lw 2 pt 7 ps 0.8
set style line 3 lt 2 lc rgb "#FFD700" lw 2 pt 7 ps 0.8

set style fill solid 0.2 border

# with linespoints - link with points

plot "soak_testing.dat" using 1:2 ls 2 title 'Load Size 80%' with filledcurves x1 axes x1y1,\
     "soak_testing.dat" using 1:4 ls 3 title 'Load Size 10%' with filledcurves x1 axes x1y1,\
     "soak_testing.dat" using 1:3 ls 1 title 'Memory Allocated' with filledcurves x1 axes x1y2 fs transparent
