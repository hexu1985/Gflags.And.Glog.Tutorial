#!/usr/bin/env bash

echo "./sample"
./sample

echo
echo

echo "./sample --alsologtostderr=true"
./sample --alsologtostderr=true

echo
echo

echo "./sample --alsologtostderr=true --colorlogtostderr=true"
./sample --alsologtostderr=true --colorlogtostderr=true

echo
echo

echo "./sample --stderrthreshold=0"
./sample --stderrthreshold=0

echo
echo

echo "./sample --log_dir=."
./sample --log_dir=.
ls -l 

echo
echo

echo "./sample --log_dir=. --minloglevel=2"
./sample --log_dir=. --minloglevel=2
ls -l 
