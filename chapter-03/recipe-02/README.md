### 设置flag变量

一些flag会影响Glog的输出行为。如果编译glog的时候依赖了gflags库，可以在命令行传递flag，
但需要在调用google::InitGoogleLogging()之前调用gflags::ParseCommandLineFlags()初始化。

示例代码如下：

```cpp
int main(int argc,char* argv[])
{
    google::ParseCommandLineFlags(&argc, &argv, true);
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
    显示所有 VLOG(m) 的日志， m 小于等于该flag的值。会被 --vmodule 覆盖。

- vmodule （ string ，默认为 "" ）
    每个模块的详细日志的级别。参数为逗号分隔的一组 <module name>=<log level> 。 <module name> 支持通配（即gfs*代表所有gfs开头的名字），匹配不包含扩展名的文件名（忽略 .cc/.h./-inl.h 等）。 <log level> 会覆盖 --v 指定的值。 

logging.cc 中还定义了其他一些flag。grep一下 DEFINE_ 可以看到全部。
