### 自动删除旧日志文件

glog可以根据日期，自动删除旧的日志文件，通过如下代码：

```cpp
google::EnableLogCleaner(3); // 保留最近三天的日志文件
```

glog每次flush的时候，都会检查是否有过期的日志文件，以上面的示例代码为例，glog会删除最后修改时间大于3天前的日志文件。

也可以通过如下代码关闭自动删除旧日志文件的功能：

```cpp
google::DisableLogCleaner();
```
