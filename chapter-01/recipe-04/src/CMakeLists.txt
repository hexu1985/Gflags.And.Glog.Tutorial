cmake_minimum_required(VERSION 3.0 FATAL_ERROR)
project(examples)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

find_package( gflags REQUIRED )

if ( gflags_FOUND )
	message(STATUS "Found gflags")
else()
	message(STATUS "Not found gflags")
endif ()

aux_source_directory(. SRC_LIST)

add_executable(bar ${SRC_LIST})

target_link_libraries(bar ${GFLAGS_LIBRARIES})
