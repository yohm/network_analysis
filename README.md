# Network Analysis

A program to conduct a typical network analysis.
By giving a data of undirected weighted network, you will get

- basic network statistics
    - number of nodes
    - number of edges
    - average degree
    - clustering coefficient
    - average edge weight
    - average overlap
- P(k): degree distribution
- P(w): edge weight distribution
- P(s): node strength distribution
- C(k): clustering spectrum (local clustering coefficient as a function of degree)
- s(k): node strength as a function of degree
- k_{nn}(k): average degree of neighbors of nodes having degree k (assortativity)
- O(w): link overlap as a function of link weight
- link removal percolation analysis
    - See [Onnela et al., PNAS 104(18):7332 (2007)](http://www.pnas.org/content/104/18/7332).

# Input format

Network should be given by a text file, where each row indicates a link.
Each row consists of three columns. The first two columns indicate the node ids while the last column denotes the link weight.
So the input file looks like the following.

```
0 3 38
0 4 796
1 2 1
1 7 34
2 4 34
5 6 1
...
```

You can find a sample input file `sample/net.edg` in this repository.

# Usage

## Compiling

C++ boost library is required. Please install it on your system.
If you are using MacOSX, just run

```
brew install boost
```

Or you can just download the file from [the boost official page](http://www.boost.org/) since we need header files only.

Run `make` to compile the program. Specify `CPP` or `INCLUDE` environment variables if necessary.

```
env CXX=g++ INCLUDE=-I/usr/local/include make
```

You will find `analyzer.out`.
Since the makefile is very simple, you can edit it by yourself if you encountered a trouble.

## Running

Just run `run.sh` specifing the network file and output directory as arguments.

```
./run.sh net.edg ./out
```

Then you'll find the output files in the current directory.
If you specify the second argument, output files are generated in that directory.

## Plotting

We prepared gnuplot scripts to make plots.

```
./plot/plot_all.sh [result directory]
```

The argument specifies the output directory. Please specify the directories where the result files are generated.
In the same directory, figure files are generated.
For example, run

```
./plot/plot_all.sh ./out
```

You'll find sample outputs in `sample` directory in thie repository.

# LICENSE

The MIT License (MIT)

Copyright (c) 2016 Yohsuke Murase

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

