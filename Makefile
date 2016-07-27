CPP=$(shell (which icpc 2>/dev/null || which g++-5 || which g++) | tail -n 1)
OPT=-O2 -Wall -std=c++11
INCLUDE=-I${BOOST_PATH}

all: analyzer.out 

HEADERS=network.hpp
SRCS=analysis_main.cpp network.cpp
analyzer.out: $(SRCS) $(HEADERS) Makefile
	$(CPP) $(OPT) $(INCLUDE) ${SRCS} -o $@

clean:
	rm -f *.out *~ *.bak

