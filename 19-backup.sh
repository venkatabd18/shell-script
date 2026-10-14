#!/bin/bash

SOUR_DIR=/home/ec2-user/app
DEST_DIR=/home/ec2-user/backup

USAGE(){
    echo "use case: 19-backup.sh <source_dir> <destination_dir> <no.of days>"
}

if [ ! -d $SOUR_DIR ]
then
    echo "$SOUR_DIR not exist"
    exit 1
fi 

if [ ! -d $DEST_DIR ]
then
    echo "$DEST_DIR not exist"
    exit 1
fi

if [ $# -lt 2 ]
then
    USAGE
fi

FILES=$/home/ec2-user/app/*.log

if [ -f $FILES ]
then
    echo "files are exist"
else
    echo "files are not exist"
    exit 1
fi

