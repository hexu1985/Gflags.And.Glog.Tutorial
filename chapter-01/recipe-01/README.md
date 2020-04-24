### gflags编译安装

编译gflags项目需要依赖cmake：

```
$ git clone https://github.com/gflags/gflags.git gflags
$ cd gflags
$ mkdir build
$ cd build
$ cmake -DCMAKE_INSTALL_PREFIX=~/local \
	-DBUILD_gflags_LIB=ON \
	-DBUILD_STATIC_LIBS=ON \
	-DINSTALL_STATIC_LIBS=ON \
	-DBUILD_SHARED_LIBS=OFF \
	-DINSTALL_SHARED_LIBS=OFF \
	-DREGISTER_INSTALL_PREFIX=OFF ..
$ cmake --build . --target install
```

或者更简单的方式

```
$ git clone https://github.com/gflags/gflags.git gflags
$ cd gflags
$ cmake -H. -Bbuild \
    -DCMAKE_INSTALL_PREFIX=~/local \
	-DBUILD_gflags_LIB=ON \
	-DBUILD_STATIC_LIBS=ON \
	-DINSTALL_STATIC_LIBS=ON \
	-DBUILD_SHARED_LIBS=OFF \
	-DINSTALL_SHARED_LIBS=OFF \
	-DREGISTER_INSTALL_PREFIX=OFF
$ cmake --build build --target install
```

CMAKE_INSTALL_PREFIX指定安装目录前缀，可能需要sudo权限执行install命令
