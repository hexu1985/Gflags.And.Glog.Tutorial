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

