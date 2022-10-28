#!/bin/bash

#Run the 3 programs against all input data
#and put all results together in a CSV file

output="simulation.csv"
header="vertices;arcprob;maxcapacity;dimic_capacity;dimic_time;capacity_mpm;mpm_time;ek_capacity;ek_time"
echo $header > $output

for vertices in 100 200 400 800 1600; do
  for arcprob in 10 20 40 80; do
    for maxcapacity in 5 10 20 40 80 160 320; do
      filename=data$vertices"_"$arcprob"_"$maxcapacity
      input=inputs/$filename.in
      echo "Processing $input"

      result="$vertices;$arcprob;$maxcapacity;"

      result+=$(./Dinic 300 $input)";"
      result+=$(./MPM 300 $input)";"
      result+=$(./EK 300 $input)

      echo $result | sed 's/ /;/g' > $output

    done
  done
done
