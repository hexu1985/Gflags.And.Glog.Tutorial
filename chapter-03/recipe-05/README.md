### 调试模式日志

调试模式的日志宏只在调试模式下有效，在非调试模式（一般是定义了NDEBUG宏）会被清除。可以避免生产环境的程序由于大量的日志而变慢。

```cpp
DLOG(INFO) << "Found cookies";

DLOG_IF(INFO, num_cookies > 10) << "Got lots of cookies";

DLOG_EVERY_N(INFO, 10) << "Got the " << google::COUNTER << "th cookie";
```


