### 检验输入参数是否合法

gflags库支持定制自己的输入参数检查的函数，通过`DEFINE_validator`注册指定flag的检查函数，
当注册了检查函数后，ParseCommandLineFlags解析到指定flag时，或者通过SetCommandLineOption修改
指定flag的值时，都会调用注册的检查函数。检查函数返回类型为bool型，返回true表示flag的值是有效的，
返回false表示flag的值是非法的。如果ParseCommandLineFlags解析时，检查函数返回false，程序会报错并提前退出。
如果调用SetCommandLineOption时，检查函数返回false，flag对应的值不会改变，程序也不会报错退出。
例子如下：

```cpp
static bool ValidatePort(const char* flagname, int32 value) {
	if (value > 0 && value < 32768)   // value is ok
		return true;
	printf("Invalid value for --%s: %d\n", flagname, (int)value);
	return false;
}
DEFINE_int32(port, 0, "What port to listen on");
DEFINE_validator(port, &ValidatePort);
```
