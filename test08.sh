#!/bin/sh
# test08.sh
# Nan Wu
# 14/7/19
# this test is testing the behaviour of legit-rm --cached file

touch a b c
echo "a line 1"  > a
echo "b line 1" > b
echo "c line 1" > c
echo "d line 1" > d
echo "e line 1" > e
./legit-init
./legit-add a b e
./legit-commit -m "first"
./legit-rm --cached a

rm -r .legit
