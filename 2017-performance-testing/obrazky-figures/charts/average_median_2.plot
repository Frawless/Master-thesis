set terminal pdf font 'CMU SERIF' size 6,3
#set terminal postscript eps font 'Roman' color size 9,3
#set size 1200,400
set output '../average_median_2.pdf'
set title 'Latency Measurement Histogram' font ",16"
set grid

set xlabel 'Response Time [s]'
#set xdata time
set xrange [0.5:12.5]
set xtics 1 nomirror

set ylabel 'Count of Response Time [CoRT]'
set yrange [0:9] nowriteback norevers
set ytics 1 nomirror

set style line 1 lt -1 lc rgb "#c5e3df" lw 2
set style line 2 lt 9 lc rgb "#DC143C" lw 4

set style data filledcurves

set style fill solid 1 border lc '#5DA5DA'
set boxwidth 0.35 absolute

# with linespoints - link with points

set parametric

set trange [0:9]

set key left

plot "average_median_2.dat" using 1:2 ls 1 notitle with boxes,\
     9.00, t with lines title 'Median' lc rgb '#FF0000' dashtype 4 lw 3,\
     7.48, t with lines title 'Average' lc rgb '#00008B' dashtype 2 lw 3,\
     11.00, t with lines title '90th percentile' lc rgb '#2F4F4F' dashtype 3 lw 6
