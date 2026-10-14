#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)

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

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)
echo "Files are : $FILES"

#check $FILES variable empty or not
if [ ! -z $FILES ]
then
    echo "Files are exist"
    ZIP_FILE=$DEST_DIR/app-log-$TIME_STAMP.zip
    find $SOURCE_DIR -name "*.log" -mtime +$DAYS | zip $ZIP_FILE -@
    if [ -f $ZIP_FILE ]
    then
        echo "Zipping is success"
        while IFS= read -r file
        do
            echo "deleating file is $file"
            rm -rf $file
        done <<< $FILES
    else
        echo "Zipping is failed"
        exit 1
    fi
else
    echo "No files older than $DAYS"
    exit 1
fi