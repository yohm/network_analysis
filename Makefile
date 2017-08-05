OPT ?= -O2 -Wall -std=c++11

all: analyzer.out  egonet_com.out

HEADERS=network.hpp
SRCS=analysis_main.cpp network.cpp
analyzer.out: $(SRCS) $(HEADERS) Makefile
	$(CXX) $(OPT) ${SRCS} -o $@

egonet_com.out: egonet_com.cpp network.hpp network.cpp
	$(CXX) $(OPT) -I infomap/include -L infomap/lib -lInfomap egonet_com.cpp network.cpp -o $@

clean:
	rm -f *.out *~ *.bak

