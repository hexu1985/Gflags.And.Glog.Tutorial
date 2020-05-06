mkdir build_debug
cd build_debug
cmake -Dglog_DIR=~/local/lib/cmake/glog \
    -Dgflags_DIR=~/local/lib/cmake/gflags \
    -DCMAKE_BUILD_TYPE=Debug \
    ..
VERBOSE=1 cmake --build . --config Debug
