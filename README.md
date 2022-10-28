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

## Compilling the algorithms code

There are three programs written in C++ (EK.cpp, Dinic.cpp, MPM.cpp) that implements
the algorithms above. They can compiled with the `Makefile`.

```
$ make
g++ -std=c++11 -O3 -DNDEBUG -Wall -Wextra -pedantic -o Dinic Dinic.cpp
g++ -std=c++11 -O3 -DNDEBUG -Wall -Wextra -pedantic -o EK EK.cpp
g++ -std=c++11 -O3 -DNDEBUG -Wall -Wextra -pedantic -o MPM MPM.cpp
```

## Running the algorithms for solving the maximun flow problem

The three algorithms receive 2 params: the maximum CPU-time in seconds to run
the program and the name of the file that contains the input graph. For example,
to run 'Dinic' with a cut-off time of 100 sec and the input file `data.in` we can
this:

```
$ ./Dinic 100 data.in
8 3.219e-06
```

The output means that Dinic algorithm found the maximum flow as 8 in 3.219e-06 sec.

Due `gen.py` with 50 vertices have some generated unfeasible graphics, we
discarded this all this graphs. The same way `gen.py` with 100 vertices and
5% of probability of generating an arc between two vertices also have generated
a unfeasible graphis, we also have discarted all graphics with 5% of probability of generating an arc between two vertices.

So, we executed the three programs againts the input data and putted all results
together in a CSV file to analysis. This was automated with the
`runner_all_programs.sh` script and we used 300 seconds as maximum CPU-time:

```
$ ./runner_all_programs.sh
```

### The output file layout

The output file is a CSV file, which we called `simulation.csv`, with `;` as separator.
The columns are: vertices, arcprob, maxcapacity, dimic_capacity, dimic_time, capacity_mpm, mpm_time, ek_capacity, ek_time.

The columns `*_capacity` are supposed has the same value for the three programs.
