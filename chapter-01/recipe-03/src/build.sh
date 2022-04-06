cmake -H. -Bbuild -Dgflags_INCLUDE_DIRS=~/local/gflags/include \
	-Dgflags_LIB_DIRS=~/local/gflags/lib
VERBOSE=1 cmake --build build
