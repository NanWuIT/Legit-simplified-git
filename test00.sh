#!/bin/sh
# test00.sh
# Nan Wu
# 12/7/19
# this test case will test the part of legit-commit
# when the file that we add does not include in the previous commit
# directory, whether the legit-commit could commit correctly

# in the begining, making sure the enviroment is clean
if [ -e .legit ]
then
	rm -r .legit
else
	:
fi

# then start our test
sh legit-init

echo a line >a

sh legit-add a

sh legit-commit -m "first"

# create another file that does not exitst in the last commit directory
echo does not exist >b

sh legit-add b

# if the output = "nothing to commit", then the test is failed
# else, the test is successed
./legit-commit -m "second"

rm -r .legit



