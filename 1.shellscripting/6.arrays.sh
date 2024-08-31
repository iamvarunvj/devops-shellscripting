#!/bin/bash

#index starts from 0, size is 3
FRUITS=("APPLE","KIWI","ORANGE")  #Array

echo "First Fruit is: ${FRUITS[0]}"
echo "Seconed Fruit is: ${FRUITS[1]}"
echo "Third Fruit is: ${FRUITS[2]}"

echo "All Fruits are: ${FRUITS[@]}"