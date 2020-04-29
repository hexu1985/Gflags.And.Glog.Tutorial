### 判断gflags变量是否被用户使用

在gflags.h中，还定义了一些平常用不到的函数和结构体。这里举一个例子，判断参数port有没有被用户设定过

示例代码如下：

```cpp
gflags::CommandLineFlagInfo info;
if(GetCommandLineFlagInfo("port" ,&info) && info.is_default) {
    std::cout << "port is default!" << std::endl;
}
```
