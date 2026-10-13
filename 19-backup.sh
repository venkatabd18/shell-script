#!/bin/bash

APP_DIR=/home/ec2-user/app
ARC_DIR=/home/ec2-user/backup

if [ ! -d $APP_DIR ]
then
    echo "app dir not exist"
    exit 1
fi

if [ ! -d $ARC_DIR ]
then
    echo "backup dir not exist"
    exit 1
fi

FILES=$(find . -name "*.log" -mtime +14)

echo file are $FILES