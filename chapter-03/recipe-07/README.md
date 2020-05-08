### 状态检查

常做状态检查以尽早发现错误是一个很好的编程习惯。 CHECK 宏和标准库中的 assert 宏类似，可以在给定的条件不满足时终止程序。

CHECK 和 assert 不同的是，它不由 NDEBUG 控制，所以一直有效。因此下面的 fp->Write(x) 会一直执行：

```cpp
CHECK(fp->Write(x) == 4) << "Write failed!";
```

有各种用于相等/不等检查的宏： CHECK_EQ, CHECK_NE, CHECK_LE, CHECK_LT, CHECK_GE, CHECK_GT 。它们比较两个值，在不满足期望时打印包括这两个值的 FATAL 日志。注意这里的值需要定义了 operator<<(ostream, ...) 。

比如：

```cpp
CHECK_NE(1, 2) << ": The world must be ending!";
```

每个参数都可以保证只用一次，所以任何可以做为函数参数的都可以传给它。参数也可以是临时的表达式，比如：

```cpp
CHECK_EQ(string("abc")[1], 'b');
```

如果一个参数是指针，另一个是 NULL ，编译器会报错。可以给 NULL 加上对应类型的 static_cast 来绕过。

```cpp
CHECK_EQ(some_ptr, static_cast<SomeType*>(NULL));
```

更好的办法是用 CHECK_NOTNULL 宏：

```cpp
CHECK_NOTNULL(some_ptr);
some_ptr->DoSomething();
```

该宏会返回传入的指针，因此在构造函数的初始化列表中非常有用。

```cpp
struct S {
  S(Something* ptr) : ptr_(CHECK_NOTNULL(ptr)) {}
  Something* ptr_;
};
```

因为该特性，这个宏不能用作C++流。如果需要额外信息，请使用 CHECK_EQ 。

如果是需要比较C字符串（ char* ），可以用 CHECK_STREQ, CHECK_STRNE, CHECK_STRCASEEQ, CHECK_STRCASENE 。 CASE 的版本是不区分大小写的。这里可以传入 NULL 。 NULL 和任何非 NULL 的字符串是不等的，两个 NULL 是相等的。

这里的参数都可以是临时字符串，比如 CHECK_STREQ(Foo().c_str(), Bar().c_str()) 。

CHECK_DOUBLE_EQ 宏可以用来检查两个浮点值是否等价，允许一点误差。 CHECK_NEAR 还可以传入第三个浮点参数，指定误差。

当这些宏判定条件不成立时，glog会生成一个FATAL级别的日志信息，该信息包含比较的两个值和stream方式传入的字符串，然后中止程序。
