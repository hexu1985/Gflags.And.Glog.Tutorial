### gflags使用简介

首先需要include "gflags.h"

```cpp
#include <gflags/gflags.h>
```

将需要的命令行参数使用gflags的宏：`DEFINE_xxxxx`(变量名，默认值，help-string) 定义在文件当中，注意全局域哦。gflags支持以下类型：

```
DEFINE_bool: boolean
DEFINE_int32: 32-bit integer
DEFINE_int64: 64-bit integer
DEFINE_uint64: unsigned 64-bit integer
DEFINE_double: double
DEFINE_string: C++ string
```

在main函数中加入：（一般是放在main函数的头几行）

```
gflags::ParseCommandLineFlags(&argc, &argv, true);
```

argc和argv想必大家都很清楚了，说明以下第三个参数的作用：

- 如果为true，ParseCommandLineFlags会从argv中移除标识和它们的参数，相应减少argc的值。然后 argv 只保留命令行参数。

- 如果为false，ParseCommandLineFlags会保留argc不变，但将会重新调整它们的顺序，使得标识在前面。

这样，在后续代码中可以使用`FLAGS_`变量名访问对应的命令行参数了

```cpp
printf("%s", FLAGS_mystr);
```

最后，编译成可执行文件之后，用户可以使用：executable --参数1=值1 --参数2=值2 ... 来为这些命令行参数赋值。

```shell
./mycmd --var1="test" --var2=3.141592654 --var3=32767 --mybool1=true --mybool2 --nomybool3
```

gflags 提供多种命令行设置参数。

string和int之类，可以用如下方式：

```
./mycmd --languages="chinese,japanese,korean"
./mycmd -languages="chinese,japanese,korean"
./mycmd --languages "chinese,japanese,korean"
./mycmd -languages "chinese,japanese,korean"
```

对于boolean的标识来说，用如下方式:

```
./mycmd --big_menu
./mycmd --nobig_menu
./mycmd --big_menu=true
./mycmd --big_menu=false
```

和getopt()一样，--将会终止标识的处理。所以在./mycmd -f1 1 -- -f2 2中， f1被认为是一个标识，但f2不会。

gflags 还提供一些内置的特殊标识：

```
--help  显示文件中所有标识的完整帮助信息
--helpfull  和-help 一样，
--helpshort  只显示当前执行文件里的标志
--helpxml  以 xml 凡是打印，方便处理
--version  打印版本信息，由 google::SetVersionString()设定
--flagfile  -flagfile=f 从文件 f 中读取命令行参数
...
```

具体见：<http://gflags.googlecode.com/svn/trunk/doc/gflags.html>
