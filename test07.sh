#!/bin/sh
# test07.sh
# Nan Wu
# 14/7/19
# this test is mainly test legit-init

# rm file not in current directory but in index
# no issue runs as normal
# there is no message can be shown
./legit-show :a
echo text >a
# rm file in current directory not in index
# should print "legit.pl: error: 'file' not in the legit repository"
./legit-rm a
./legit-show :a
# rm file not in either
# print "legit.pl: error: 'file' not in the legit repository"
./legit-rm non_existing_file

# rm file that has been changed after being added to the repository
# should print "legit.pl: error: 'file' in repository is different to working file"
echo "test1 recreated" > b
./legit-add b
./legit-commit -m "third"
echo "test1 new line" >> b
./legit-rm b
rm -r .legit
./legit-rm a
rm -r .legit

rm -r .legit
