cmake -H. -Bbuild -DCMAKE_INSTALL_PREFIX=~/local/gflag \
	-DBUILD_gflags_LIB=ON \
	-DBUILD_STATIC_LIBS=ON \
	-DINSTALL_STATIC_LIBS=ON \
	-DBUILD_SHARED_LIBS=ON \
	-DINSTALL_SHARED_LIBS=ON \
	-DREGISTER_INSTALL_PREFIX=OFF 
cmake --build build --target install
