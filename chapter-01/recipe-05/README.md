### 项目依赖glog库：Makefile

需要指定glog库，通过-lglog指定，而且可能需要依赖-lpthread（linux平台上）

需要-I指定glog头文件的安装路径（如果编译glog的时候依赖了gflags库，那么也需要-I指定gflags头文件的安装路径）

需要-L指定glog库的安装路径（如果编译glog的时候依赖了gflags库，那么也需要-L指定gflags库的安装路径）


#### glog和gflags都为动态库时,有可能会运行时找不到gflags库

运行程序时提示如下:
```
$ ./sample
./sample: error while loading shared libraries: libgflags.so.2.2: cannot open shared object file: No such file or directory
```

ldd查看sample程序, 可以发现找不到libgflags.so:
```
$ ldd sample
        linux-vdso.so.1 (0x00007ffdae2cb000)
        libglog.so.1 => /home/hexu/local/glog/lib/libglog.so.1 (0x00007fde5ca73000)
        libstdc++.so.6 => /usr/lib/x86_64-linux-gnu/libstdc++.so.6 (0x00007fde5c6ea000)
        libgcc_s.so.1 => /lib/x86_64-linux-gnu/libgcc_s.so.1 (0x00007fde5c4d2000)
        libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007fde5c0e1000)
        libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007fde5bec2000)
        libgflags.so.2.2 => not found
        libunwind.so.8 => /usr/lib/x86_64-linux-gnu/libunwind.so.8 (0x00007fde5bca7000)
        /lib64/ld-linux-x86-64.so.2 (0x00007fde5cebb000)
        libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007fde5b909000)
        liblzma.so.5 => /lib/x86_64-linux-gnu/liblzma.so.5 (0x00007fde5b6e3000)
        libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007fde5b4df000)
```

但其实我们的sample程序已经通过runpath指定了运行时加载库的路径,
```
$ readelf -d sample

Dynamic section at offset 0xd60 contains 31 entries:
  标记        类型                         名称/值
 0x0000000000000001 (NEEDED)             共享库：[libglog.so.1]
 0x0000000000000001 (NEEDED)             共享库：[libstdc++.so.6]
 0x0000000000000001 (NEEDED)             共享库：[libgcc_s.so.1]
 0x0000000000000001 (NEEDED)             共享库：[libc.so.6]
 0x000000000000001d (RUNPATH)            Library runpath: [/home/hexu/local/gflags/lib:/home/hexu/local/glog/lib]
 ...
```

我们通过LD_DEBUG进一步查看具体原因, 发现是因为glog的动态库依赖了gflags的动态库, 
```
$ LD_DEBUG=all ./sample >& log.txt
$ vim log.txt
file=libgflags.so.2.2 [0];  needed by /home/hexu/local/glog/lib/libglog.so.1 [0]
```
虽然我们在sample的runpath里增加了gflags的路径, 但是glog的.so里并没有设置runpath, 这一点可以通过readelf -d libglog.so验证

所以目前解决的方法有两种,简单的和复杂的
- 简单的, 设置LD_LIBRARY_PATH
- 复杂的, patchelf修改libglog.so的runpath, 把gflags的路径加上

```
$ patchelf --set-rpath "/home/hexu/local/gflags/lib/" libglog.so
hexu@hexu-Lenovo-Legion-Y7000P2020H:~/local/glog/lib$ readelf -d libglog.so

Dynamic section at offset 0x4b1f8 contains 31 entries:
  标记        类型                         名称/值
 0x000000000000001d (RUNPATH)            Library runpath: [/home/hexu/local/gflags/lib/]
 0x0000000000000001 (NEEDED)             共享库：[libpthread.so.0]
 0x0000000000000001 (NEEDED)             共享库：[libgflags.so.2.2]
 0x0000000000000001 (NEEDED)             共享库：[libunwind.so.8]
 0x0000000000000001 (NEEDED)             共享库：[libstdc++.so.6]
 0x0000000000000001 (NEEDED)             共享库：[libc.so.6]
 0x0000000000000001 (NEEDED)             共享库：[ld-linux-x86-64.so.2]
 0x000000000000000e (SONAME)             Library soname: [libglog.so.1]
```
