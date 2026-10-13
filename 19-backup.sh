#!/bin/bash

APP_DIR=/home/ec2-user/app
ARC_DIR=/home/ec2-user/backup

if [ ! -d $APP_DIR ]
then
    echo "app dir not exist"
    exit 1
fi