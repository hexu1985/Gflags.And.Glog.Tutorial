mkdir build
cd build
cmake -Dglog_DIR=~/local/glog/lib/cmake/glog \
    ..
#    -Dgflags_DIR=~/local/lib/cmake/gflags \
VERBOSE=1 cmake --build . 
