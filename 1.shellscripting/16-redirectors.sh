#!/bin/bash

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log"
mkdir -p $LOGS_FOLDER

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$R Please run this script with root privelages $N" &>>$LOG_FILE
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -eq 0 ]
    then
    echo -e "$2 is ...$G SUCCESS $N" &>>$LOG_FILE
    else
    echo -e "$2 is ...$R FAILED $N" &>>$LOG_FILE
    fi
}

USAGE(){
    echo -e "$R USAGE:: $N sudo sh 16-redirectorsh.sh package1 package2 ..."
    exit 1
}

CHECK_ROOT

if [ $# -eq 0 ]
then
    USAGE
fi

for package in $@  # $@ refers to all the arguments passed to it while running this script
do
    echo "verifying $package status" &>>$LOG_FILE
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo "$package is not installed, going to install it..." &>>$LOG_FILE
        dnf install $package -y
        VALIDATE $? "Installing $package"
    else
        echo "$package is installed already..nothing to do" &>>$LOG_FILE
    fi
done