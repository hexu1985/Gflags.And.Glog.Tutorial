#include <glog/logging.h>

int main(int argc,char* argv[])
{
    google::InitGoogleLogging(argv[0]);
    FLAGS_stderrthreshold=google::INFO;
    FLAGS_colorlogtostderr=true;

    DLOG(INFO) << "DLOG test";

    for(int i = 1; i <= 100;i++)
    {
        DLOG_IF(INFO,i==100)<<"DLOG_IF(INFO,i==100)  google::COUNTER="<<google::COUNTER<<"  i="<<i;
        DLOG_EVERY_N(INFO,10)<<"DLOG_EVERY_N(INFO,10)  google::COUNTER="<<google::COUNTER<<"  i="<<i;
        DLOG_IF_EVERY_N(WARNING,(i>50),10)<<"DLOG_IF_EVERY_N(WARNING,(i>50),10)  google::COUNTER="<<google::COUNTER<<"  i="<<i;
    }

    google::ShutdownGoogleLogging();

    return 0;
}
