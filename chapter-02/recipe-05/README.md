### 定制你自己的help信息与version信息

gflags里面已经定义了-h和--version，你可以通过以下方式定制它们的内容：

1. version信息：使用gflags::SetVersionString设定，使用gflags::VersionString访问

2. help信息：使用gflags::SetUsageMessage设定，使用gflags::ProgramUsage访问

注意：gflags::SetUsageMessage和gflags::SetVersionString必须在gflags::ParseCommandLineFlags之前执行
