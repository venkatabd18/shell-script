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

FILES=$(find /home/ec2-user/app-log/ -name "*.log" -mtime +14)
echo "files are $FILES"

