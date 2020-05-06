### 细节（VERBOSE）日志

当你在追比较复杂的bug的时候，详细的日志信息非常有用。但同时，在通常开发中需要忽略太详细的信息。对这种细节日志的需求，Glog提供了 VLOG 宏，使你可以自定义一些日志级别。通过 --v 可以控制输出的细节日志：

```cpp
VLOG(1) << "I'm printed when you run the program with --v=1 or higher";
VLOG(2) << "I'm printed when you run the program with --v=2 or higher";
```

和日志级别相反，级别越低的 VLOG 越会打印。比如 --v=1 的话， VLOG(1) 会打印， VLOG(2) 则不会打印。对 VLOG 宏和 --v flag可以指定任何整数，但通常使用较小的正整数。 VLOG 的日志级别是 INFO 。

细节日志可以控制按模块输出：

```shell
--vmodule=mapreduce=2,file=1,gfs*=3 --v=0
```

会：

a. 为 mapreduce.{h,cc} 打印 VLOG(2) 和更低级别的日志  
b. 为 file.{h,cc} 打印 VLOG(1) 和更低级别的日志  
c. 为前缀为gfs的文件打印 VLOG(3) 和更低级别的日志  
d. 其他的打印 VLOG(0) 和更低级别的日志  

其中 (c) 给出的通配功能支持 * （0或多个字符）和 ? （单字符）通配符。

细节级别的条件判断宏 VLOG_IS_ON(n) 当 --v 大于等于n时返回true。比如：

```cpp
if (VLOG_IS_ON(2)) {
    // do some logging preparation and logging
    // that can't be accomplished with just VLOG(2) << ...;
}
```

此外还有 VLOG_IF, VLOG_EVERY_N, VLOG_IF_EVERY_N ，和 LOG_IF, LOG_EVERY_N, LOF_IF_EVERY 类似，但是它们传入的是一个数字的细节级别。

```cpp
VLOG_IF(1, (size > 1024))
    << "I'm printed when size is more than 1024 and when you run the "
       "program with --v=1 or more";
VLOG_EVERY_N(1, 10)
    << "I'm printed every 10th occurrence, and when you run the program "
       "with --v=1 or more. Present occurence is " << google::COUNTER;
VLOG_IF_EVERY_N(1, (size > 1024), 10)
    << "I'm printed on every 10th occurence of case when size is more "
       " than 1024, when you run the program with --v=1 or more. ";
       "Present occurence is " << google::COUNTER;
```
