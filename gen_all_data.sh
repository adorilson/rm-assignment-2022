#!/bin/bash
#create input data
for vertices in 50 100 200 400 800 1600; do
  for arcprob in 5 10 20 40 80; do
    for maxcapacity in 5 10 20 40 80 160 320; do
      p=$(bc -l <<<"$arcprob/100")
      seed=$(bc -l <<<"$vertices+$arcprob+$maxcapacity")
      filename="inputs/"data$vertices"_"$arcprob"_"$maxcapacity".in"
      echo "python3 gen.py $vertices $p $maxcapacity $seed $filename"
      python3 gen.py $vertices $p $maxcapacity $seed $filename
    done
  done
done
