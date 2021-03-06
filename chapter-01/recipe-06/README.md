### 项目依赖glog库：CMake，通过find_package

通过find_package查找glog，并不需要设置include_directories

```
find_package(glog REQUIRED)
```

通过target_link_libraries链接glog库，并不需要设置link_directories

```
target_link_libraries(sample glog::glog)
```

编译项目需要设置glog_DIR路径：如果编译glog的时候依赖了gflags库，还需要设置gflags_DIR路径

```
$ mkdir build
$ cd build
$ cmake -Dglog_DIR=~/local/lib/cmake/glog \
    -Dgflags_DIR=~/local/lib/cmake/gflags \
    ..
$ VERBOSE=1 cmake --build . 
```

或者用更简单的方式，只需两行命令：

```
$ cmake -Bbuild -H. \
    -Dglog_DIR=~/local/lib/cmake/glog \
    -Dgflags_DIR=~/local/lib/cmake/gflags
$ cmake --build build
```

