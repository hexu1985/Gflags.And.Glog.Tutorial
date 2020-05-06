#!/usr/bin/env bash

echo "./sample"
./sample

echo
echo

echo "GLOG_colorlogtostderr=true GLOG_alsologtostderr=true ./sample"
GLOG_colorlogtostderr=true GLOG_alsologtostderr=true ./sample

echo
echo

echo "GLOG_colorlogtostderr=true GLOG_alsologtostderr=true ./sample --v=3"
GLOG_colorlogtostderr=true GLOG_alsologtostderr=true ./sample --v=3

