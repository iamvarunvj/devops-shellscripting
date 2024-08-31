#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root privelages"
    exit 1
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
    echo "$2 is ... SUCCESS"
    else
    echo "$2 is ... FAILED"
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
    dnf install mysql -y
    VALIDATE $? "Installing MySQL"
else
    echo "MySQL is installed already"
fi 