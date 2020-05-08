### 异常信号处理

glog提供了比较方便的程序异常处理机制。例如，当程序出现SIGSEGV异常信号时，glog的默认异常处理过程会导出非常有用的异常信息。
异常处理过程可以通过google::InstallFailureSignalHandler()来自定义。下面为异常处理过程的输出例子：

```
*** Aborted at 1225095260 (unix time) try "date -d @1225095260" if you are using GNU date ***
*** SIGSEGV (@0x0) received by PID 17711 (TID 0x7f893090a6f0) from PID 0; stack trace: ***
PC: @           0x412eb1 TestWaitingLogSink::send()
    @     0x7f892fb417d0 (unknown)
    @           0x412eb1 TestWaitingLogSink::send()
    @     0x7f89304f7f06 google::LogMessage::SendToLog()
    @     0x7f89304f35af google::LogMessage::Flush()
    @     0x7f89304f3739 google::LogMessage::~LogMessage()
    @           0x408cf4 TestLogSinkWaitTillSent()
    @           0x4115de main
    @     0x7f892f7ef1c4 (unknown)
    @           0x4046f9 (unknown)
```
