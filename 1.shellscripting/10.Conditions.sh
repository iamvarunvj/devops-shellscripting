#!/bin/bash

NUM=$1

if [ $NUM -ge 20 ] #gt,lt, eq, -ne, -ge
then
    echo "Given Number: $NUM is greater than 20"
else
    echo "Give Number: $NUM is less than 20"
fi
