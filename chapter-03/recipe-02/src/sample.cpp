#include <errno.h>
#include <gflags/gflags.h>
#include <glog/logging.h>
#include <glog/raw_logging.h>   // for RAW_LOG

int main(int argc,char* argv[])
{
    google::InitGoogleLogging(argv[0]);
    gflags::ParseCommandLineFlags(&argc, &argv, true);

    LOG(INFO) << "LOG(INFO)";
    LOG(WARNING) << "LOG(WARNING)";
    LOG(ERROR) <<"LOG(ERROR)";
    VLOG(3) <<"VLOG";
    DLOG(ERROR) <<"DLOG";
    DVLOG(3) <<"DVLOG";
    SYSLOG(ERROR) <<"SYSLOG";

    errno = ERANGE;
    PLOG(ERROR) <<"PLOG";
    RAW_LOG(ERROR,"RAW_LOG");

    google::ShutdownGoogleLogging();
    gflags::ShutDownCommandLineFlags();

    return 0;
}
