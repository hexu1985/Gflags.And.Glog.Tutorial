#!/usr/bin/env bash

rm -r ./log
mkdir ./log
echo "./sample --log_dir=log"
./sample --log_dir=log
ls -l log

echo
echo

echo "./sample --log_dir=log"
./sample --log_dir=log
ls -l log

echo
echo

date

FIVE_DAY_AFTER=$(date "+%F %T" -d"+5 day")

echo "set date +5 day"
sudo date -s "${FIVE_DAY_AFTER}"

echo
echo

echo "./sample --log_dir=log"
./sample --log_dir=log
ls -l log

echo
echo

echo "./sample --log_dir=log --keep_logs_days=3"
./sample --log_dir=log --keep_logs_days=3
ls -l log

BACK_DAY=$(date "+%F %T" -d"-5 day")
echo "set date back"
sudo date -s "${BACK_DAY}"

echo
echo

date


