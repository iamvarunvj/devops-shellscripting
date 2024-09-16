#!/bin/bash

SOURCE_DIR=$1
DEST_FIR=$2
DAYS=${3:-14}  #if $3 is empty, default is 14 days
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\2[33m"

USAGE() {
    echo -e "$R Error $N:: 19.backup.sh <SOURCE> <DESTINATION> <DAYS(Optional)>"
}

if [ $# -lt 2 ]
then
    USAGE
fi




if [ ! -d $SOURCE_DIR ]
then
    echo "$SOURCE_DIR does not present .. please check"
fi

if [ ! -d $DEST_FIR ]
then
    echo "$DEST_FIR does not present ...please check"
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +14)

echo "Files :$FILES"
if [ ! -z $FILES ] #-z $FILES returns true if files are empty, ! makes expression false
then
    echo "Files are found"
    $ZIP_FILE="$DEST_FIR/app-logs-$TIMESTAMP.zip"
    (find $SOURCE_DIR -name "*.log" -mtime +14 | zip $ZIP_FILE -@)

    #check if zip file is successfully created or not
    if [ -f $ZIP_FILE ]
    then
        echo "Successfully ziped files older than $DAYS"
        #Delete the Files from the Source
        while IFS= read -r file #
        do
            echo "Deleting line : $file"
            rm -rf $file
        done <<< $FILES
    else
        echo "Zipping of files failed"
        exit 1
    fi
else
    echo "No files older than $DAYS"
    exit 1
fi
