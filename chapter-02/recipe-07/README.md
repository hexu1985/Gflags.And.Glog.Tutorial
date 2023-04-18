### 允许未定义的输入参数

在命令行使用未定义的flag会在执行时失败。如果需要允许未定义的flag，可以使用 --undefok 来去掉报错。

默认情况下，如果name没有通过DEFINED定义，命令行参数包含--name时，程序会在ParseCommandLineFlags时报错并退出。例如：

```shell
./mycmd --inexist
ERROR: unknown command line flag 'inexist'
```

如果指定了--undefok=name，命令行参数包含--name时，ParseCommandLineFlags会忽略不识别的name参数。

多个参数可以通过`--undefok=flagname1,flagname2,...`的方式指定。

注释：和 getopt() 一样， -- 可以用于结束flag。

