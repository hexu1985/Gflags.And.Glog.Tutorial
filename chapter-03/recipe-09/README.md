### 自定义失败处理函数

FATAL 级别的日志和 CHECK 条件失败时会终止程序。可以用 InstallFailureFunction 改变该行为。

示例代码如下：

```cpp
void YourFailureFunction() {
      // Reports something...
      exit(1);
}

int main(int argc, char* argv[]) {
      google::InstallFailureFunction(&YourFailureFunction);
}
```

默认地，Glog会导出stacktrace，程序以状态1退出。stacktrace只在Glog支持栈跟踪的系统架构（x86和x86_64）上导出。


