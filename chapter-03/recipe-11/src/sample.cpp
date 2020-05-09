#include <gflags/gflags.h>
#include <glog/logging.h>

DEFINE_int32(keep_logs_days, -1, "keep your logs for n days");

int main(int argc,char* argv[])
{
    gflags::ParseCommandLineFlags(&argc, &argv, true);
    google::InitGoogleLogging(argv[0]); //初始化 glog

    if (FLAGS_keep_logs_days > 0) {
        google::EnableLogCleaner(FLAGS_keep_logs_days); // keep your logs for FLAGS_keep_logs_day days
    } else {
        google::DisableLogCleaner();
    }

    char str[20] = "hello log!";    
    LOG(INFO) << str ;                 // << " cookies";    
    LOG(WARNING) << "warning test";    // 会输出一个Warning日志    
    LOG(ERROR) << "error test";        // 会输出一个Error日志 

    google::ShutdownGoogleLogging();
    gflags::ShutDownCommandLineFlags();

    return 0;
}
