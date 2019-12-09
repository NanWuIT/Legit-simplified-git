#!/bin/sh
# test06.sh
# Nan Wu
# 14/7/19
# Test focusing on the commit -a option, will show whether it
# would add the correct commit directories
./legit-init
echo 1 > a
echo 1 > b
echo 1 > c
echo 1 > d
echo 1 > e
./legit-commit -a -m 'a'
./legit-commit -m 'a' -a
./legit-status
./legit-add a b
./legit-commit -a -m 'b'
./legit-status
echo 1 > a
echo 2 > b
./legit-status
./legit-commit -a -m 'c'
./legit-commit -a -m 'd'
./legit-status
echo 3 > a
echo 3 > b
./legit-add c d
./legit-status
echo 4 > c
echo 4 > d
./legit-commit -a -m 'd'
./legit-log
./legit-status
echo 5 > a
./legit./commit -a -a -a -a -a -a -m 'e' -a -a -a -a -a -a
./legit-status
./legit-log
./legit-show 3:a
./legit-show 4:a

rm -r .legit
