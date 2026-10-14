#!/bin/bash

SOURCE_DIR=$1
DESTIN_DIR=$2
#DAYS=$3 #DAYS=${3: -14} --- If #3 is not given default is 14days
DAYS=${3:-14}

USAGE(){
    echo "use::19-backup <source> <destination> <no.of days>"
}

if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]
then
    echo "source dir not exist"
    exit 1
fi

if [ ! -d $DESTIN_DIR ]
then
    echo "Destination dir not exist"
    exist 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime $DAYS)
echo "files are $FILES"

if [ ! -z $FILES ]
then
    echo "files exist"
else
    echo "No files older than 14days"
    exit 1
fi