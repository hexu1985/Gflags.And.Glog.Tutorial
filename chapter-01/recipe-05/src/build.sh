cmake -H. -Bbuild \
    -Dglog_INCLUDE_DIRS=~/local/glog/include \
	-Dglog_LIB_DIRS=~/local/glog/lib \
    -Dgflags_INCLUDE_DIRS=~/local/gflags/include \
	-Dgflags_LIB_DIRS=~/local/gflags/lib
VERBOSE=1 cmake --build build
