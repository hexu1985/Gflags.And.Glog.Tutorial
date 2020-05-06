### 条件输出日志

有时你可能只想在满足一定条件的时候打印日志。可以使用下面的宏来按条件打印日志：

```cpp
LOG_IF(INFO, num_cookies > 10) << "Got lots of cookies";
```

上面的日志只有在满足 num_cookies > 10 时才会打印。

另一种情况，如果代码被执行多次，可能只想对其中某几次打印日志。

```cpp
LOG_EVERY_N(INFO, 10) << "Got the " << google::COUNTER << "th cookie";
```

上面的代码会在执行的第1、11、21、...次时打印日志。google::COUNTER 记录该语句被执行次数。

可以将这两种日志用下面的宏合并起来。

```cpp
LOG_IF_EVERY_N(INFO, (size > 1024), 10) << "Got the " << google::COUNTER
                                        << "th big cookie";
```

不过要注意，是先每隔 10 次去判断条件是否满足，如果是true则输出日志；而不是当满足某条件的情况下，每隔 10 次输出一次日志信息。

不只是每隔几次打印日志，也可以限制在前n次打印日志：

```cpp
LOG_FIRST_N(INFO, 20) << "Got the " << google::COUNTER << "th cookie";
```

上面会在执行的前20次打印日志。
