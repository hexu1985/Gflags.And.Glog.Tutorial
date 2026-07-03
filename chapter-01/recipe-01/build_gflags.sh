cmake -S . -B build -DGFLAGS_BUILD_SHARED_LIBS=ON
cmake --build build
cmake --install build --prefix ~/local/gflags

