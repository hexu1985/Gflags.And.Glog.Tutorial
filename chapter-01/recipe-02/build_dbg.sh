cmake -H. -Bbuild -DCMAKE_INSTALL_PREFIX=~/local/glog_dbg \
    -DCMAKE_BUILD_TYPE=Debug \
    -Dgflags_DIR=~/local/gflag_dbg/lib/cmake/gflags/ \
    -DBUILD_SHARED_LIBS=ON
cmake --build build --target install
