#!/bin/bash

git init 

read -p "Username : " user 
read -p "email : " email 


git config --global user.name "$user"
git config --global user.email "$email"
sudo git config --system core.editor nano
git config --global credential.helper cache 
git config --global credential.helper 'cache --timeout=25000'
git config --global push.default simple

echo "done"