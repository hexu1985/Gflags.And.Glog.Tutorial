### 通过环境变量传递参数

如果我们想让程序直接从环境变量中读取参数值，可以使用`--formenv`来指定。

比如：`--fromenv=foo,bar`表明要从环境变量读取foo，bar两个参数的值。在设置环境变量时必须包含`FLAGS_`前缀，例如：

```shell
$ export FLAGS_foo=xxx; export FLAGS_bar=yyy
$ ./cmd --fromenv=foo,bar
```

这等价于通过命令行指定`--foo=xxx, --bar=yyy`

如果指定了`--fromenv=foo`但foo并没有通过DEFINED定义，那边程序也会在ParseCommandLineFlags时报错并退出。例如：

```shell
./mycmd --fromenv=inexist
ERROR: unknown command line flag 'inexist' (via --fromenv or --tryfromenv)
```

如果指定了`--fromenv=foo`但是`FLAGS_foo`环境变量并没有被设置，那边程序也会在ParseCommandLineFlags时报错并退出。例如：

```shell
./mycmd --fromenv=languages
ERROR: FLAGS_languages not found in environment
```

参数`--tryfromenv`与`--fromenv`类似，当参数的没有在环境变量定义时，不退出（fatal-exit）。
例如：如果指定了`--fromenv=foo`但是`FLAGS_foo`环境变量并没有被设置，ParseCommandLineFlags会忽略不报错。



