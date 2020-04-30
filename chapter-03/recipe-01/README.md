### glog使用简介

首先需要include "glog/logging.h"

```cpp
#include <glog/logging.h>
```

通过LOG(XXX)宏定义的stream对象输出日志：

```cpp
LOG(INFO) << "Hello,GLOG!";
```

在main函数中加入google::InitGoogleLogging())：（一般是放在main函数的开头）

```cpp
int main(int argc, char* argv[]) {
    // Initialize Google's logging library.
    google::InitGoogleLogging(argv[0]);

    // ...
    LOG(INFO) << "Found " << num_cookies << " cookies";
}
```

可以指定下面这些级别（按严重性递增排序）： INFO, WARNING, ERROR, and FATAL 。打印 FATAL 消息会在打印完成后终止程序。和其他日志库类似，级别更高的日志会在同级别和所有低级别的日志文件中打印。

则默认运行会将日志输出到 /tmp 目录下（格式为 "<program name>.<hostname>.<user name>.log.<severity level>.<date>.<time>.<pid>"），也可以使用设置临时环境变量的方式（给命令行参数加上 GLOG_ 前缀），如 GLOG_logtostderr=1 ./your_application 将日志输出到 stderr。

