### 项目依赖gflags库：CMake，通过find_package

通过find_package查找gflags，并不需要设置include_directories

```
find_package(gflags REQUIRED)
```

通过target_link_libraries链接gflags库，并不需要设置link_directories

```
target_link_libraries(sample ${GFLAGS_LIBRARIES})
```

编译项目需要设置GTest_DIR路径：

```
$ mkdir build
$ cd build
$ cmake -Dgflags_DIR=~/local/lib/cmake/gflags \
    ..
$ VERBOSE=1 cmake --build . 
```

或者用更简单的方式，只需两行命令：

```
$ cmake -Bbuild -H. -Dgflags_DIR=~/local/lib/cmake/gflags
$ cmake --build build
```


