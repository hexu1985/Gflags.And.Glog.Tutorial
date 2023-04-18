### 通过配置文件传递参数

如果参数比较多，那么在执行程序的时候，会显得非常的冗余。可以使用`--flagfile`来指定从文件中读取参数值。比如`--flagfile=my.conf`表明要从my.conf文件读取参数的值。

在配置文件中指定参数值与在命令行方式类似，另外在flagfile里可进一步通过--flagfile来包含其他的文件。

配置文件中每个选项必须独立一行。例如：配置文件my.conf内容如下：

```
--nobig_menus
--languages=english,french
```

那么以下两行命令行是等价的：

```shell
$ ./mycmd --foo --flagfile=/tmp/myflags --bar
$ ./mycmd --foo --nobig_menus --languages=english,french --bar
```

flagfile中的错误都是会被忽略掉的，例如没有DEFINED的选项，以及没有提供相应值的选项（例如--languages，但没有=xxx）。

flagfile中以`#`开头的行是注释行。
