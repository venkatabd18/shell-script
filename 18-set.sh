#!/bin/bash

set -e
failure(){
    echo failure $1:$2
}

echo "Hello world"
echo date is $(date)
echoo i am from the error

trap 'failure "${LINENO}" "$BASH_COMMAND"' ERR
