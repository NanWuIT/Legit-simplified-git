#!/bin/sh
# test05.sh
# Nan Wu
# 14/7/19
# this test is mainly test the behaviour of legit-rm

./legit-rm
./legit-init
./legit-rm
./legit-rm --force --cache
./legit-rm --force a
echo 1 > a
./legit-rm --force a
./legit-add a
./legit-rm --force a
./legit-commit -m 'a'
./legit-status
./legit-rm a
./legit-rm a
./legit-rm --force a
./legit-add a
./legit-rm a
echo 1 > b
./legit-add b
./legit-commit -m 'b'

rm -r .legit
