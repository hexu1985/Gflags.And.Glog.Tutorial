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

