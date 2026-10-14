#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USAGE(){
    echo -e "$R Usage $N:: 19-backup.sh <source> <destination> <no. of days (optional)>"
}

if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]
then
    echo "$R source directory not exist $N"
    exit 1
fi

if [ ! -d $DEST_DIR ]
then
    echo "$R Destination dir not exist $N"
    exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)
echo "Files are : $FILES"

#check $FILES variable empty or not
if [[ ! -z $FILES ]]
then
    echo -e "$G Files are exist $N"
    ZIP_FILE=$DEST_DIR/app-log-$TIME_STAMP.zip
    find $SOURCE_DIR -name "*.log" -mtime +$DAYS | zip $ZIP_FILE -@
    if [ -f $ZIP_FILE ]
    then
        echo "Zipping is success"
        while IFS= read -r file
        do
            echo "$Y deleating file is $file $N"
            rm -rf $file
        done <<< $FILES
    else
        echo -e "Zipping is failed"
        exit 1
    fi
else
    echo -e "$Y No files older than $DAYS $N"
    exit 1
fi