#!/bin/sh
# test04.sh
# Nan Wu
# 14/7/19
# this test is show very basic error messages show at correct times
./legit-init
touch a b c d
./legit-add
echo 1 > a
./legit-add a
./legit-add b
./legit-add ''
./legit-commit
./legit-commit -m
./legit-commit -m ''
./legit-commit -m abc
./legit-log
./legit-show
./legit-show 0:abc
./legit-show 0:''
./legit-init abc
./legit-init
./legit-init
./legit-log
./legit-show
./legit-commit
./legit-commit -m ''
./legit-commit -m abc

rm -r .legit

