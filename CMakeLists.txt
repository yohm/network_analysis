cmake_minimum_required(VERSION 3.7)
project(network_analysis)

set(CMAKE_CXX_STANDARD 11)

set(SOURCE_FILES
        network.cpp
        network.hpp)

add_executable(analyzer.out analysis_main.cpp ${SOURCE_FILES})

include_directories(infomap/include)
link_directories(infomap/lib)
add_executable(egonet_com.out egonet_com.cpp ${SOURCE_FILES})
target_link_libraries(egonet_com.out Infomap)

