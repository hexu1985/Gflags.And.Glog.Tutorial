cmake -H. -Bbuild -DCMAKE_INSTALL_PREFIX=~/local/glog \
    -Dgflags_DIR=~/local/gflag/lib/cmake/gflags/ \
    -DBUILD_SHARED_LIBS=ON
cmake --build build --target install
