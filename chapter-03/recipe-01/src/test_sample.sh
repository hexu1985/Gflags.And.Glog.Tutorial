#!/usr/bin/env bash

echo "./sample"
./sample

echo
echo

echo "GLOG_alsologtostderr=true ./sample"
GLOG_alsologtostderr=true ./sample
