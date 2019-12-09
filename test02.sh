#!/bin/sh
# test02.sh
# Nan Wu
# 14/7/19
# this file test the legit-commit part, when the previous commit
# directory contains files that are all the same with files in the
# index directory, how would the legit-commit -a -m message
# deal with, whether it would say "nothing to commit"
./legit-init
echo line1 >a
echo hello >b
echo world >c
echo excellent >d
./legit-add a b
./legit-commit -m "first"
./legit-rm b
echo hello >b
./legit-add b
# this action should report nothing to commit
./legit-commit -m "duplication"

rm -r .legit
