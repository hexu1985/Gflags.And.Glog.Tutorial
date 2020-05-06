mkdir build_release
cd build_release
cmake -Dglog_DIR=~/local/lib/cmake/glog \
    -Dgflags_DIR=~/local/lib/cmake/gflags \
    -DCMAKE_BUILD_TYPE=Release \
    ..
VERBOSE=1 cmake --build . --config Release
