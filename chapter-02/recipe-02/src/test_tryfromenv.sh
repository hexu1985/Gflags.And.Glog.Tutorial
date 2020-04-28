#!/usr/bin/env bash

echo "./sample --tryfromenv=nosuch"
./sample --tryfromenv=nosuch

echo
echo

echo "./sample --tryfromenv=languages"
./sample --tryfromenv=languages

echo
echo

echo "FLAGS_languages=chinese ./sample --tryfromenv=languages"
FLAGS_languages=chinese ./sample --tryfromenv=languages


