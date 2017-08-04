#include <iostream>
#include <fstream>
#include <cstdlib>
#include <string>
#define NS_INFOMAP
#include <Infomap.h>
#include "network.hpp"

size_t NumCommunities( const Network& net ) {
  infomap::Infomap iwrapper("-2 -s 1234 --silent");
  // infomap::Infomap iwrapper("-2 --overlapping -s 1234"); // if I specify `overlapping`, a bus error occurs
  for( const Network::Link& l: net.m_links ) {
    iwrapper.addLink(l.m_node_id1, l.m_node_id2, l.m_weight);
  }
  iwrapper.run();
  return iwrapper.tree.numTopModules();
  /*
  for(infomap::LeafIterator leafIt(&iwrapper.tree.getRootNode()); !leafIt.isEnd(); ++leafIt) {
    std::cout << leafIt->originalLeafIndex << " " << leafIt.moduleIndex() << '\n';
  }
   */
}

int main( int argc, char* argv[]) {
  if (argc != 2 && argc != 3) {
    std::cerr << "Usage : ./main.out <edge_file> [num_nodes]" << std::endl;
    exit(1);
  }

  Network network;
  std::ifstream fin(argv[1]);
  std::cerr << "Loading input file" << std::endl;
  network.LoadFile(fin);

  size_t num_egos = network.NumNodes();
  if( argc == 3 ) {
    num_egos = static_cast<size_t>( std::atol(argv[2]) );
  }

  for( size_t i=0; i<num_egos; i++) {
    const Network egonet = network.EgocentricNetwork(i);
    if( egonet.NumEdges() < 2 ) { continue; }
    // egonet.Print(std::cout);
    std::cout << NumCommunities(egonet) << std::endl;
  }
}

