cmake -H. -Bbuild -DCMAKE_INSTALL_PREFIX=~/local/glog_dbg \
    -DCMAKE_BUILD_TYPE=Debug \
    -Dgflags_DIR=~/local/gflags_dbg/lib/cmake/gflags/ \
    -DBUILD_SHARED_LIBS=OFF
cmake --build build --target install
