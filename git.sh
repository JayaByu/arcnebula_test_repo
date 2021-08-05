#!/bin/bash

git pull 
git add * 

echo "input coment/description"
read input

git commit -m $input
git push -u origin master
git status

echo "done"