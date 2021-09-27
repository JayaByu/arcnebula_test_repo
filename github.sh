#!/usr/bin/env bash

x21="\e[0;31m" #rd
x12="\e[1;32m" #grn
x33="\e[0;34m" #bl
x00="\e[0m" #n

clear
echo "Your Ip : "$(ip -o route get to 8.8.8.8 | sed -n 's/.*src \([0-9.]\+\).*/\1/p')
sleep 0.8
clear

function ret() {
    clear
    ret=$(pwd)/'github.sh'  
    bash $ret
}

echo -e "${x12}

    ╭╮       ╭╮╭╮      ╭╮
   ╭╯╰╮     ╭╯╰┫┃      ┃┃
╭━━╋╮╭╯╭╮╭╮╭╋╮╭┫╰━╮ ╭━━┫╰━╮
┃╭╮┣┫┃ ┃╰╯╰╯┣┫┃┃╭╮┃ ┃━━┫╭╮┃
┃╰╯┃┃╰╮╰╮╭╮╭┫┃╰┫┃┃┃╭╋━━┃┃┃┃
╰━╮┣┻━╯ ╰╯╰╯╰┻━┻╯╰╯╰┻━━┻╯╰╯
╭━╯┃
╰━━╯

${x00}"
date
echo -e "Author :${x33} Artemis ${x00}" 
echo " "
echo "1. Setup Git Profile Account"
echo "2. Do Your Git"
echo "3. Branch"

read -p "root@artemis: " choose

if [[ $choose == 1 ]];
    then
        read -p "Your Username : " user
        read -p "Your Github Email : " email

        git config --global user.name "$user"
        git config --global user.name "$email"
    
        echo " "
        echo "Your Account information s: "
        git config --list | grep -w "user"

        ret

elif [[ $choose == 2 ]];
    then

    git init 

    read -p "Input file directory or file in your dir : " dir
    read -p "Input your comment : " comment
    read -p "Input url : " url
    read -p "Input your branch master or main :" branch

    git add $dir
    git commit -m "$comment"
    
    git remote add origin $url     
    git push origin $branch

elif [[ $choose == 3 ]];
    then
        echo "1. Check all branch"
        echo "2. Chenck branch name"
        echo "3. delete branch"

        read -p "Input Branch : " INPUTBRANCH
        
        if [[ $INPUTBRANCH == 1 ]];
            then
                git branch
        elif [[ $INPUTBRANCH == 2 ]];
            then
                read -p "Input branch name : " namebranch
                git branch $namebranch
        elif [[ $INPUTBRANCH == 3 ]];
            then
                echo '1. safe delete : '
                echo '2. force delete : '
                    read -p "input number : " number
                        if [[ $number == 1 ]];
                            then
                                read -p "Delete your branch name : " del
                                git branch -d $del
                        
                        elif [[ $number == 2 ]];
                            then
                                read -p "Delete your branch name : " del
                                git branch -D $del
                                
                        fi
                
                                
        fi

fi



