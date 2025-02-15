cmake -H. -Bbuild \
	-DBUILD_gflags_LIB=ON \
	-DBUILD_STATIC_LIBS=ON \
    -DBUILD_SHARED_LIBS=OFF \
	-DINSTALL_STATIC_LIBS=ON \
	-DINSTALL_SHARED_LIBS=OFF \
	-DREGISTER_INSTALL_PREFIX=OFF 
cmake --build build --parallel 4 
cmake --install build --prefix ~/local/gflags
