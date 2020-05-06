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

rm -r ./log
mkdir ./log
echo "./sample --log_dir=log"
./sample --log_dir=log
ls -l log

echo
echo

rm -r ./log
mkdir ./log
echo "./sample --log_dir=log --minloglevel=2"
./sample --log_dir=log --minloglevel=2
ls -l log
