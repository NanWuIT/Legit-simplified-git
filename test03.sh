#!/bin/sh
# test03.sh
# Nan Wu
# 14/7/19
# test script testing the behaviour of show using subset 0 commands

touch a b c
echo "test1 line 1" > a
echo "test2 line 1" > b
echo "test3 line 1" > c

./legit-init
./legi-add a b
./legit-commit -m "first"
./legit-show 0:a
./legit-show 0:b
./legit-show 0:c
./legit-show 1:a
./legit-add test3 
./legit-commit -m "second"
./legit-show 1:a
./legit-show 1:b
./legit-show 1:c
./legit-show 0:c
#in the index
./legit-show :a
./legit-show :b
./legit-show :d
echo "test4 line 1" > d
./legit-add d
./legit-show :d

#error message testing
echo "show a"
./legit-show a
echo "show 2:test1"
./legit-show 2:test1
echo "show a:test1"
./legit-show a:test1
echo "show"
./legit-show

rm -rf .legit
