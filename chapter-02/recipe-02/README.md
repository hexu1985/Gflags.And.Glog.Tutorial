### 特殊的flag变量

gflags 还提供一些内置的特殊标识：

| flag          | description                                                        |
| :------------ | :----------------------------------------------------------------- |
| --help        | 显示所有文件的所有flag，按文件、名称排序，显示flag名、默认值和帮助 |
| --helpfull    | 和 --help 相同，显示全部flag                                       |
| --helpshort   | 只显示执行文件中包含的flag，通常是 main() 所在文件                 |
| --helpxml     | 类似 --help，但输出为xml                                           |
| --helpon=FILE | 只显示定义在 FILE.* 中得flag                                       |
| --helpmatch=S | 只显示定义在 *S*.* 中的flag                                        |
| --helppackage | 显示和 main() 在相同目录的文件中的flag                             |
| --version     | 打印执行文件的版本信息                                             |

#### --undefok=flagname,flagname,...

默认情况下，如果name没有通过DEFINED定义，命令行参数包含--name时，程序会在ParseCommandLineFlags时报错并退出。例如：

```shell
./mycmd --inexist
ERROR: unknown command line flag 'inexist'
```

如果指定了--undefok=name，命令行参数包含--name时，ParseCommandLineFlags会忽略不识别的name参数。

#### --fromenv

`--fromenv=foo,bar`的意思是说通过环境变量读取foo和bar参数的值。在设置环境变量时必须包含`FLAGS_`前缀，例如：

```shell
export FLAGS_foo=xxx; export FLAGS_bar=yyy   # sh
setenv FLAGS_foo xxx; setenv FLAGS_bar yyy   # tcsh
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

#### --tryfromenv

tryfromenv和fromenv非常类似，除了一种情况：如果指定了`--fromenv=foo`但是`FLAGS_foo`环境变量并没有被设置，ParseCommandLineFlags会忽略不报错。

#### --flagfile

`--flagfile=f`告诉ParseCommandLineFlags去文件f读取并设置命令行选项。

文件f中每个选项必须独立一行。例如有一个flagfile：/tmp/myflags内容如下：

```
--nobig_menus
--languages=english,french
```

那么以下两行命令行是等价的：

```shell
$ ./mycmd --foo --nobig_menus --languages=english,french --bar
$ ./mycmd --foo --flagfile=/tmp/myflags --bar
```

flagfile中的错误都是会被忽略掉的，例如没有DEFINED的选项，以及没有提供相应值的选项（例如--languages，但没有=xxx）。

flagfile中以`#`开头的行是注释行。
