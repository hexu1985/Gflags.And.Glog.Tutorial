#include <glog/logging.h>

int main(int argc,char* argv[])
{
    google::ParseCommandLineFlags(&argc, &argv, true);
    google::InitGoogleLogging(argv[0]); //初始化 glog

    char str[20] = "hello log!";    
    LOG(INFO) << str ;                 // << " cookies";    
    LOG(WARNING) << "warning test";    // 会输出一个Warning日志    
    LOG(ERROR) << "error test";        // 会输出一个Error日志 

    google::ShutdownGoogleLogging();
    google::ShutDownCommandLineFlags();

    return 0;
}
