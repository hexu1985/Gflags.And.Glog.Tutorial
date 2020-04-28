#!/usr/bin/env bash

echo "./sample --tryfromenv=inexist"
./sample --tryfromenv=inexist

echo
echo

echo "./sample --tryfromenv=languages"
./sample --tryfromenv=languages

echo
echo

echo "FLAGS_languages=chinese ./sample --tryfromenv=languages"
FLAGS_languages=chinese ./sample --tryfromenv=languages


