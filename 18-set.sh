#!/bin/bash

set -e

failure(){
    echo failure at $1: $2
}

trap 'failure "${LINE}" "${BASH_COMMAND}"' ERR

echo "Hello world"
echoo "I am from world one"
echo "i am running after error"