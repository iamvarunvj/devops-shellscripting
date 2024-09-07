#!/bin/bash

#which directory
#is that directory exists or not?
#only need .log files

SOURCE_DIR=/home/ec2-user/logs
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

if [ -d $SOURCE_DIR ]
then
    echo -e "$SOURCE_DIR $G Source directory exsits $N"
else
    echo -e "$SOURCE_DIR $R Source directory doesn't exsits $N"
    exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +14)

echo "Files $FILES"

while IFS= read -r line #
do
    echo "Deleting line : $line"
    rm -rf $line
done <<< $FILES