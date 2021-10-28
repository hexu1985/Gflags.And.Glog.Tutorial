cmake -H. -Bbuild -DCMAKE_INSTALL_PREFIX=~/local \
    -Dgflags_DIR=~/local/lib/cmake/gflags/ \
    -DBUILD_SHARED_LIBS=OFF 
cmake --build build --target install
