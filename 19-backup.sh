#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}

USAGE(){
    echo "Usage:: 19-backup.sh <source> <destination> <no. of days (optional)>"
}

if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]
then
    echo "source directory not exist"
    exit 1
fi

if [ ! -d $DEST_DIR ]
then
    echo "Destination dir not exist"
    exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +14)
echo "Files are : $FILES"