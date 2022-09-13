#!/usr/bin/env bash

export LD_LIBRARY_PATH=~/local/gflags/lib

echo "./sample"
./sample

echo
echo

echo "GLOG_log_dir=. GLOG_alsologtostderr=true ./sample"
GLOG_log_dir=. GLOG_alsologtostderr=true ./sample
