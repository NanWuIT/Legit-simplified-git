#!/bin/sh
# test01.sh
# Nan Wu
# 14/7/19
# this file test the legit-commit part, when the index directory
# does not exist, how would the legit-commit -a -m message
# deal with, whether it would say "legit-commit: error: 
# .legit/index does not exist" or create a directory

if [ -e .legit ]
then
	rm -r .legit
else
	:
fi

./legit-init
./a line >a
./legit-add a
# create a repository
./legit-commit -m "first"
./echo text >b
./legit-add b
rm -r .legit/index
# the legit-commit should call the index does not exist
./legit-commit -m "second"

echo b line >b

rm -r .legit
