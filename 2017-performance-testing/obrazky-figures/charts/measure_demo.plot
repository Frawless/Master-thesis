set terminal pdf font 'CMU SERIF' size 6,3
#set terminal postscript eps font 'Roman' color size 9,3
#set size 1200,400
set output '../measure_demo.pdf'
set title 'Testing Phases' font ",16"
set grid

set xlabel ''
#set xdata time
set xrange [0:127800]
set format x ""

set ylabel 'Requests Count [RPS]'
set yrange [0:2500]
set ytics 500 nomirror

set style line 1 lt 2 lc rgb "#c5e3df" lw 2 pt 7 ps 0.8
set style line 2 lt 9 lc rgb "#DC143C" lw 2 pt 7 ps 0.8
set style line 3 lt 9 lc rgb "#5DA5DA" lw 2 pt 7 ps 0.8
set style line 4 lt 9 lc rgb "#60BD68" lw 2 pt 7 ps 0.8
set style line 5 lt 9 lc rgb "#FFD700" lw 2 pt 7 ps 0.8

set style data filledcurves

#set style fill solid 1 border lc '#5DA5DA'

# with linespoints - link with points

set parametric

set trange [0:127800]

set label "{/:Bold Start}"  at 4500,1000 font "24" front
set label "{/:Bold Warmup}"  at 20000,1000 font "24" front
set label "{/:Bold Test}"  at 60000,1000 font "24" front
set label "{/:Bold Cooldown}"  at 96000,1000 font "24" front
set label "{/:Bold Stop}"  at 117500,1000 font "24" front

plot "measure_demo.dat" using 1:2 ls 4 notitle with filledcurves x1 fs solid 0.2 transparent,\
      14400, t with lines title '' lc rgb '#DC143C' dashtype 6 lw 3,\
      36000, t with lines title '' lc rgb '#DC143C' dashtype 6 lw 3,\
      91800, t with lines title '' lc rgb '#DC143C' dashtype 6 lw 3,\
      113400, t with lines title '' lc rgb '#DC143C' dashtype 6 lw 3
