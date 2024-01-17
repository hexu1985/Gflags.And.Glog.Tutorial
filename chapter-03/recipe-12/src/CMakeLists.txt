cmake_minimum_required(VERSION 3.0 FATAL_ERROR)
project(examples)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

find_package (glog REQUIRED)

add_executable(sample_noflush sample_noflush.cpp)
target_link_libraries(sample_noflush glog::glog)

add_executable(sample_flush sample_flush.cpp)
target_link_libraries(sample_flush glog::glog)
