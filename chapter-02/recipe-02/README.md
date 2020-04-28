### 特殊的选项（Special Flags）

gflags 还提供一些内置的特殊标识：

| flag          | description |
| :------------ | :---------- |
| --help        | shows all flags from all files, sorted by file and then by name; shows the flagname, its default value, and its help string |
| --helpfull    | same as -help, but unambiguously asks for all flags (in case -help changes in the future)              |
| --helpshort   | shows only flags for the file with the same name as the executable (usually the one containing main()) |
| --helpxml     | like --help, but output is in xml for easier parsing                                                   |
| --helpon=FILE | shows only flags defined in FILE.*                                                                     |
| --helpmatch=S | shows only flags defined in *S*.*                                                                      |
| --helppackage | shows flags defined in files in same directory as main()                                               |
| --version     | prints version info for the executable                                                                 |

#### --undefok=flagname,flagname,...

默认情况下，如果name没有通过DEFINED定义，命令行参数包含--name时，程序会在ParseCommandLineFlags时报错并退出。例如：

```shell
./mycmd --nosuch
ERROR: unknown command line flag 'nosuch'
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
./mycmd --fromenv=nosuch
ERROR: unknown command line flag 'nosuch' (via --fromenv or --tryfromenv)
```

如果指定了`--fromenv=foo`但是`FLAGS_foo`环境变量并没有被设置，那边程序也会在ParseCommandLineFlags时报错并退出。例如：

```shell
./mycmd --fromenv=languages
ERROR: FLAGS_languages not found in environment
```

#### --tryfromenv

tryfromenv和fromenv非常类似，除了一种情况：如果指定了`--fromenv=foo`但是`FLAGS_foo`环境变量并没有被设置，ParseCommandLineFlags会忽略不报错。

