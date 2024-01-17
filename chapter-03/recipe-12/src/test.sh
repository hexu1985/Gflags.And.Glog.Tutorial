#!/usr/bin/env bash

export LD_LIBRARY_PATH=~/local/gflags/lib

echo "./sample_noflush"
./sample_noflush

echo "./sample_flush"
./sample_flush

echo
echo

mkdir -p log
echo "GLOG_log_dir=./log GLOG_alsologtostderr=true ./sample_noflush"
GLOG_log_dir=./log GLOG_alsologtostderr=true ./sample_noflush

echo "GLOG_log_dir=./log GLOG_alsologtostderr=true ./sample_flush"
GLOG_log_dir=./log GLOG_alsologtostderr=true ./sample_flush
