cmake -H. -Bbuild -Dglog_DIR=~/local/glog/lib/cmake/glog \
    -Dgflags_DIR=~/local/gflags/lib/cmake/gflags 
VERBOSE=1 cmake --build build
