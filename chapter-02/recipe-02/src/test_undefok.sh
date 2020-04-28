#!/usr/bin/env bash

echo "./sample --inexist"
./sample --inexist

echo
echo

echo "./sample --undefok=inexist"
./sample --undefok=inexist
