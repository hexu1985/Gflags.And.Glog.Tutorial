### 日志类型

| 日志类型 | 描述                                                         |
| :------- | :----------------------------------------------------------- |
| LOG      | 内置日志                                                     |
| VLOG     | VERBOSE日志                                                  |
| DLOG     | DEBUG模式可输出的日志                                        |
| DVLOG    | DEBUG模式可输出的VERBOSE日志                                 |
| SYSLOG   | 系统日志，同时通过 syslog() 函数写入到 /var/log/message 文件 |
| PLOG     | perror风格日志，设置errno状态并输出到日志中                  |
| RAW_LOG  | 线程安全的日志，需要#include <glog/raw_logging.h>            |

前六种的日志使用方法完全相同（包括条件日志输出），而 RAW_LOG 使用方法比较特殊，且不支持条件日志输出，另外不接受 colorlogtostderr 的颜色设置。
VERBOSE日志也不接受 colorlogtostderr 的颜色设置，另外其日志严重级别为自定义数字，且与默认日志严重级别相反，数字越小严重级别越高。

SYSLOG, SYSLOG_IF,和 SYSLOG_EVERY_N宏，这些宏将日志信息通过syslog()函数记录到系统日志。ubuntu下可以查看 /var/log/syslog 文件

PLOG()、PLOG_IF() 和PCHECK()宏，在记录日志信息的时候，会将errno的状态及其描述附加到日志描述中。
如：

```cpp
PCHECK(write(1, NULL, 2) >= 0) << "Write NULL failed";
```

当条件不成立时，会输出日志信息：

```
F0825 185142 test.cc:22] Check failed: write(1, NULL, 2) >= 0 Write NULL failed: Bad address [14]
```

RAW_LOG、RAW_CHECK宏，这些宏的功能与CHECK，LOG等一致，除此以外支持线程安全，不需要为其分配任何内存和提供额外的锁（lock）机制。在<glog/raw_logging.h>文件中提供了定义。

