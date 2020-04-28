#!/usr/bin/env bash

echo "./sample --nosuch"
./sample --nosuch

echo
echo

echo "./sample --undefok=nosuch"
./sample --undefok=nosuch
