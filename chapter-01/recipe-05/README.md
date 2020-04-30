### 项目依赖glog库：Makefile

需要指定glog库，通过-lglog指定，而且可能需要依赖-lpthread（linux平台上）

需要-I指定glog头文件的安装路径（如果编译glog的时候依赖了gflags库，那么也需要-I指定gflags头文件的安装路径）

需要-L指定glog库的安装路径（如果编译glog的时候依赖了gflags库，那么也需要-L指定gflags库的安装路径）


