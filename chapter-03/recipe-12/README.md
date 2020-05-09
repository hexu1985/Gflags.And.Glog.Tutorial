### Windows用户的注意事项

Glog定义的 ERROR 日志级别，和 windows.h 中的定义有冲突。可以在引入 glog/logging.h 之前定义 GLOG_NO_ABBREVIATED_SEVERITIES ，这样Glog就不会定义 INFO, WARNING, ERROR, FATAL 。不过你仍然可以使用原来的宏：

```cpp
#define GLOG_NO_ABBREVIATED_SEVERITIES
#include <windows.h>
#include <glog/logging.h>

// ...

LOG(ERROR) << "This should work";
LOG_IF(ERROR, x > y) << "This should be also OK";
```

但是你不能再在 glog/logging.h 中的函数中使用 INFO, WARNING, ERROR, FATAL 了。

```cpp
#define GLOG_NO_ABBREVIATED_SEVERITIES
#include <windows.h>
#include <glog/logging.h>

// ...

// This won't work.
// google::FlushLogFiles(google::ERROR);

// Use this instead.
google::FlushLogFiles(google::GLOG_ERROR);
```

如果不需要使用 windows.h 中定义的 ERROR ，那么也可以尝试下面的方法：

- 在引入 windows.h 之前 #define WIN32_LEAN_AND_MEAN 或 NOGDI 。
- 在引入 windows.h 之后 #undef ERROR 。

