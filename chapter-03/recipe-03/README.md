### 日志参数设置（flag变量）

一些flag会影响Glog的输出行为。如果编译glog的时候依赖了gflags库，可以在命令行传递flag，
但需要在调用google::InitGoogleLogging()之前调用gflags::ParseCommandLineFlags()初始化。

示例代码如下：

```cpp
int main(int argc,char* argv[])
{
    gflags::ParseCommandLineFlags(&argc, &argv, true);
    google::InitGoogleLogging(argv[0]); //初始化 glog

    // ...
    LOG(INFO) << str ;                 // << " cookies";    
}
```

比如你想打开 --logtostderr flag，可以这么用：

```
./your_application --logtostderr=true
```

另外，也可以通过环境变量来设置（无论glog是否依赖gflags），在flag名前面加上前缀 GLOG_ 。比如：

```
GLOG_logtostderr=true ./your_application
```

运行参数设置的第三种方法是，可以在代码里通过加上 FLAGS_ 前缀来设置，如：

```cpp
FLAGS_stderrthreshold=google::INFO;
FLAGS_colorlogtostderr=true;

LOG(INFO) << "file";
// Most flags work immediately after updating values.
FLAGS_logtostderr = true;
LOG(INFO) << "stderr";
FLAGS_logtostderr = false;
// This won't change the log destination. If you want to set this
// value, you should do this before google::InitGoogleLogging .
FLAGS_log_dir = "/some/log/directory";
LOG(INFO) << "the same file";
```

常用的flag有：

- logtostderr （ bool ，默认为 false ）
    日志输出到stderr，不输出到日志文件。

- alsologtostderr （bool ，default=false ）
    将日志同时输出到文件和stderr。

- colorlogtostderr （ bool ，默认为 false ）
    输出彩色日志到stderr。

- stderrthreshold （ int ，默认为2，即 ERROR ）
    将大于等于该级别的日志同时输出到stderr。日志级别 INFO, WARNING, ERROR, FATAL 的值分别为0、1、2、3。

- minloglevel （ int ，默认为0，即 INFO ）
    打印大于等于该级别的日志。日志级别的值同上。

- log_dir （ string ，默认为 "" ）
    指定输出日志文件的目录。

- v （ int ，默认为0）
    对于使用“ VLOG(m)”（m为int型）表达式进行输出的日志信息，只在m的值小于该标志的值的时候，才进行输出。另外， 该设置可能被 vmodule标志给覆盖.默认为0.

- vmodule （ string ，默认为 "" ）
    分模块（文件）设置VLOG(m)日志信息的输出级别。命令格式为以逗号分开的“<module name>=<log level>”表达式组成。其中<module name> 是“glob pattern”，支持通配符，<module name>不包括文件的扩展名（.h,.cc等）。<log level> 会覆盖 --v 指定的值。 

logging.cc 中还定义了其他一些flag。grep一下 DEFINE_ 可以看到全部。
