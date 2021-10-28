### glog编译安装

编译glog项目需要依赖cmake：


```
$ git clone https://github.com/google/glog.git glog
$ cd glog
$ mkdir build
$ cd build
$ cmake -DCMAKE_INSTALL_PREFIX=~/local \
    -Dgflags_DIR=~/local/lib/cmake/gflags/ \
    -DBUILD_SHARED_LIBS=OFF \
    ..
$ cmake --build . --target install
```

或者更简单的方式

```
$ git clone https://github.com/google/glog.git glog
$ cd glog
$ cmake -H. -Bbuild \
    -DCMAKE_INSTALL_PREFIX=~/local \
    -DBUILD_SHARED_LIBS=OFF \
    -Dgflags_DIR=~/local/lib/cmake/gflags/
$ cmake --build build --target install
```

如果需要编译动态库，需要增加`BUILD_SHARED_LIBS=ON`

如果gflags_DIR无效或者不指定gflags_DIR，glog库也可以编译，但是无法通过gflags的命令行参数控制glog选项。

CMAKE_INSTALL_PREFIX指定安装目录前缀，可能需要sudo权限执行install命令
