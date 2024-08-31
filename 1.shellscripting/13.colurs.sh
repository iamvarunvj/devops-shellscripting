#!/bin/bash

USERID=$(id -u)
R="\e[32m"
G="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root privelages"
    exit 1
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
    echo -e "$2 is ...$G SUCCESS $N"
    else
    echo -e "$2 is ...$R FAILED $N"
    fi
}

dnf list installed git

if [ $? -ne 0 ]
then
    echo "Git is not installed, going to install Git"
    dnf install git -y
    VALIDATE $? "Installing Git"
else
    echo "Git is already installed nothing to do"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MySQL is not installed... going to install"
    dnf install mysqlll -y
    VALIDATE $? "Installing MySQL"
else
    echo "MySQL is installed already"
fi 