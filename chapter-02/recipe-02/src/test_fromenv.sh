#!/usr/bin/env bash

echo "./sample --fromenv=inexist"
./sample --fromenv=inexist

echo
echo

echo "./sample --fromenv=languages"
./sample --fromenv=languages

echo
echo

echo "FLAGS_languages=chinese ./sample --fromenv=languages"
FLAGS_languages=chinese ./sample --fromenv=languages


