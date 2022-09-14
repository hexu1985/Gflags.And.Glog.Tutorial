#include <gflags/gflags.h>
#include <glog/logging.h>

int main(int argc,char* argv[])
{
    google::InitGoogleLogging(argv[0]); //初始化 glog
    gflags::ParseCommandLineFlags(&argc, &argv, true);

    char str[20] = "hello log!";    
    LOG(INFO) << str ;                 // << " cookies";    
    LOG(WARNING) << "warning test";    // 会输出一个Warning日志    
    LOG(ERROR) << "error test";        // 会输出一个Error日志 

    google::ShutdownGoogleLogging();
    gflags::ShutDownCommandLineFlags();

    return 0;
}
