#include <stdint.h>
#include <stdio.h>
#include <iostream>

#include <gflags/gflags.h>
#include <glog/logging.h>

void MyFailureFunction() {
    // Reports something...
    std::cerr << __func__ << " called\n";
    exit(1);
}

/**
 *  设置命令行参数变量
 *  默认的主机地址为 127.0.0.1，变量解释为 'the server host'
 *  默认的端口为 12306，变量解释为 'the server port'
 */
DEFINE_string(host, "127.0.0.1", "the server host");
DEFINE_int32(port, 12306, "the server port");

int main(int argc, char** argv) {
    // 解析命令行参数，一般都放在 main 函数中开始位置
    gflags::ParseCommandLineFlags(&argc, &argv, true);

    google::InitGoogleLogging(argv[0]);
    FLAGS_alsologtostderr=true;

    google::InstallFailureFunction(&MyFailureFunction);

    CHECK_GT(FLAGS_port, 0) << "Invalid value for port";
    CHECK_LT(FLAGS_port, 32768) << "Invalid value for port";

    std::cout << "The server host is: " << FLAGS_host
        << ", the server port is: " << FLAGS_port << std::endl;

    return 0;
}
