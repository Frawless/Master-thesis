#!/bin/bash
FILES=$(ls obrazky-figures/charts)

cd obrazky-figures/charts/

for f in $FILES
do
if [[ "$f" == *\.plot ]]
then
  echo $f
  gnuplot $f
fi
done
