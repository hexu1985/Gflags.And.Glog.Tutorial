### 精简日志字符串信息

打印日志的代码中的字符串会增加可执行文件的大小，而且也会带来泄密的风险。可以通过使用 GOOGLE_STRIP_LOG 宏来删除所有低于特定级别的日志：

比如使用下面的代码：

```cpp
#define GOOGLE_STRIP_LOG 1    // this must go before the #include!
#include <glog/logging.h>
```

编译器会删除所有级别低于该值的日志。因为 VLOG 的日志级别是 INFO （等于0），设置 GOOGLE_STRIP_LOG 大于等于1会删除所有 VLOG 和 INFO 日志。

