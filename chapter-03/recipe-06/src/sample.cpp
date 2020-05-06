#include <glog/logging.h>

int main(int argc,char* argv[])
{
    gflags::ParseCommandLineFlags(&argc, &argv, true);
    google::InitGoogleLogging(argv[0]);
    FLAGS_alsologtostderr=true;

    VLOG(1) << "I'm printed when you run the program with --v=1 or higher";
    VLOG(2) << "I'm printed when you run the program with --v=2 or higher";

    for(int i = 1; i <= 100;i++)
    {
        VLOG_IF(2,i==100)<<"VLOG_IF(2,i==100)  google::COUNTER="<<google::COUNTER<<"  i="<<i;
        VLOG_EVERY_N(2,10)<<"VLOG_EVERY_N(2,10)  google::COUNTER="<<google::COUNTER<<"  i="<<i;
        VLOG_IF_EVERY_N(1,(i>50),10)<<"VLOG_IF_EVERY_N(1,(i>50),10)  google::COUNTER="<<google::COUNTER<<"  i="<<i;
    }

    google::ShutdownGoogleLogging();
    gflags::ShutDownCommandLineFlags();

    return 0;
}
