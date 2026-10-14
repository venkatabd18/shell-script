#!/bin/bash

SOURCE_DIR=$1
DESTIN_DIR=$2
DAYS=$3 #DAYS=${3: -14} --- If #3 is not given default is 14days

USAGE(){
    echo "use::19-backup <source> <destination> <no.of days>"
}

if [ $# -lt 3 ]
then
    USAGE
fi

