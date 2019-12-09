#!/bin/sh
# test09.sh
# Nan Wu
# 14/7/19
# test script testing the behaviour of rm from subset 1
# this test is mainly testing the legit-commit, legit-rm and legit-show

touch a b c
echo "test1 line 1"  > a
echo "test2 line 1" > b
echo "test3 line 1" > c
echo "test4 line 1" > d
echo "test5 line 1" > e
echo "test6 line 1" > f

./legit-init
./legit-add a b c d
./legit-commit -m "first"
./legit-show 0:a
./legit-show 0:b
echo "rm test1 and test5 file in last commit"
# a and e file should be removed from the current directory and the index
./legit-rm a e
./legit-show 0:a
./legit-show 0:e
echo "rm test3 file not in the last commt or index"
./legit-rm c
# c should not be removed from the currect directory. 
# Print error message "legit.pl: error: 'c' not in the legit repository"
./legit-add c
./legit-rm c
# c should still be present in the current directory and the index. 
# Print error message "legit.pl: error: 'file' has changes staged in the index"
./legit-commit -m "second"
./legit-show 1:c
echo "rm file test3 that has been committed"
echo ""
./legit-rm c
#test3 should be removed from the index and the current directory
./legit-show 1:c
#rm a file that has been committed in a commit that was not in the previous commit
./legit-rm f

#error testing

#rm file not in current directory but in index
#no issue runs as normal
rm b
./legit-rm b

#rm file in current directory not in index
#print "legit.pl: error: 'file' not in the legit repository"
./legit-add d
rm .legit/index/d
./legit-rm d
./legit.pl show :d

#rm file not in either
#print "legit.pl: error: 'file' not in the legit repository"
./legit-rm f

#rm file that has been changed after being added to the repository
#print "legit.pl: error: 'file' in repository is different to working file"
echo "test1 recreated" > a
./legit-add a
./legit-commit -m "third"
echo "test1 new line" >> a
./legit-rm a

#when no commits have occurred
rm -rf.legit
./legit-rm a

rm -rf .legit


rm -r .legit
