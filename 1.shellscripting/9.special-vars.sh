#!/bin/bash

echo "All variables passed to the script: $@"
ARR=($@)

echo "element at 1 is ${ARR[0]}"
echo "element at 1 is ${ARR[1]}"

echo "All elements are ${ARR[@]}"

echo "Number of Elements present is:: $#"

echo "Script Name is :$0"

echo "Present working directory is :$PWD"

echo "Home Directory is :$HOME"

echo "PID of the script executing now:$$"
sleep 100 &
echo "PID of last background command: $!"
echo "PID of last background command: $?"