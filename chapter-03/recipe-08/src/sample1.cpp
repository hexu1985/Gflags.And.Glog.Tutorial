#include <glog/logging.h>
#include <iostream>

void fun()
{
    int* pi = new int;
    delete pi;

    pi = nullptr;
    int j = *pi;
}

int main(int argc,char* argv[])
{
    gflags::ParseCommandLineFlags(&argc, &argv, true);
    google::InitGoogleLogging(argv[0]);
    FLAGS_stderrthreshold = google::INFO;
    FLAGS_alsologtostderr=true;
    FLAGS_colorlogtostderr=true;

    google::InstallFailureSignalHandler();

    fun();

    google::ShutdownGoogleLogging();
    gflags::ShutDownCommandLineFlags();

    return 0;
}
