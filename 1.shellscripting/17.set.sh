#!/bin/bash

set -e 
# setting the automatic exit if we get error. set -ex for debugging purpose.

failure(){

}

trap 'failure "${LINENO}" "${BASH_COMMAND}"' ERR # ERR is the error signal

echo "Hello World"
echoooo "Hello World failure"
echo "Hello world after failure"