#!/bin/bash

BLACKLIST="master"
echo "Do you want to delete all branches other than:"
echo "master"
for ARG in $*; do
  echo $ARG
  BLACKLIST+="\|${ARG}"
done
echo "Y/N"
read response
if [ "$response" = "y" ] || [ "$response" = "Y" ]
  then
    echo "Yep"
    eval git branch | grep -ve "$BLACKLIST" | xargs git branch -D
  else
    echo "Goodbye"
fi