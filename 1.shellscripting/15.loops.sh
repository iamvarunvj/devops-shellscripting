#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "Please run this script with root privelages"
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -eq 0 ]
    then
    echo -e "$2 is ...$G SUCCESS $N"
    else
    echo -e "$2 is ...$R FAILED $N"
    fi
}

CHECK_ROOT

for package in $@  # $@ refers to all the arguments passed to it while running this script
do
    echo $package
done