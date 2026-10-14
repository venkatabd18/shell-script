#!/bin/bash

SOUR_DIR=/home/ec2-user/app
DEST_DIR=/home/ec2-user/backup

if [ ! -d $SOUR_DIR ]
then
    echo "$SOUR_DIR not exist"
    exit 1
fi 

if [ ! -d DEST_DIR ]
then
    echo "$DEST_DIR not exist"
fi