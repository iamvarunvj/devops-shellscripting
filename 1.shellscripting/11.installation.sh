#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root privelages"
    exit 1
fi

dnf list installed git

if [ $? -ne 0 ]
then
    echo "Git is not installed, going to install Git"
    dnf install git -y
    if [$? -ne 0 ]
        echo "Git Installation is not success....Please check it"
        exit 1
    else
        echo "Git Installation is success"
    fi
else
    echo "Git is already installed nothing to do"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MySQL is not installed... going to install"
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "MySQL installation failed....plese check it"
    else
        echo "MySQL installtion completed successfully"
    fi
else
    echo "MySQL is installed already"
fi