#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Please run this script with the root privelages"
    #To stop installation Use exit 1
fi


pwd