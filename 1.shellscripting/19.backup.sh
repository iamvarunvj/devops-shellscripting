#!/bin/bash
SOURCE_DIR=$1
DEST_FIR=$2
DAYS={$3:-14}  #if days are empty it will be 14 days

R="\e[31m"
G="\e[32m"
N="\e[0m"

USAGE() {
    echo -e "$R Error $N:: 19.backup.sh <SOURCE> <DESTINATION> <DAYS(Optional)>"
}

if [ $# lt 2 ]
then
    USAGE
fi
