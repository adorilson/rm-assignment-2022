# Research Methods 2022/2023- Quantitate Assignment

This repository is about a assignment from Research Methods discipline from
University of Coimbra, in the year 2022/2013. It is a exercise of designig
an experiment, which aims to perform quantitate analisys.

## Problem to be analyzed

Given a directed graph, the [Maximum Flow Problem](https://en.wikipedia.org/wiki/Maximum_flow_problem)
consists of finding the maximum flow that can sent from a source vertex to a
target vertex, without exceeding the capacity of each arc. We assume that a
capacity of each arc is a positive integer. This problem arises in many real-life
applications, for instance, to find a set of disjoint paths in a communications
network taking into account the maximum bandwidth between every two network nodes.

There are several algorithms to solve this problem for a given input. For this
project, we will consider three algorithms for the maximum flow problem:
Edmond-Karp (EK), Dinic, and Malhotra, Pramodh-Kumar and Maheshwari (MPM). For
a given graph G=(V, A), where V is the vertex set and A is the arc set, EK
Algorithm has a time complexity of O(|V||A|²), whereas Dinic has O(|A||V|2²)
and MPM has O(|V|³). Therefore, the first is better suited for graphs with few
arcs, while the last two are better for graphs with fewer vertices. However,
these are theoretical results that only apply to the worst case and it is hard
to extrapolate them for a given particular problem input.

The goal is to investigate the runtime performance of these three algorithms in
practice.

## Input data

To generate input data we can use the `gen.py` file. For example, to generated
input data with 10 vertices, 40% of probability of generating an arc between two
vertices, 100 as the maximum capacity that can be assigned to an arc, a random
seed 3125, and store it in file `data.in`, we use the follow command:

```
$ python3 gen.py 10 0.4 100 3125 data.in
```

We generated input data with the `gen_all_data.sh` script, that run the `gen.py`
scripts some times, with different arguments:

```
$ ./gen_all_data.sh
```

This script generate the input data for graphs with the parameters follows:
1. vertices: range from 50 to 1600, where each step is the previous times 2
1. arc probability: 5, 10, 20, 40 and 80%.
1. maximum capacity: 5 to 320, where each step is the previous times 2

The seeds was `vertices+arc probability+maximum capacity`, and this data are in
`inputs` folder.
