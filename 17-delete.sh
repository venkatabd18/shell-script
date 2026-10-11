#!/bin/bash

SOURCE_DIR=/home/ec2-user/shell-script/raju

if [ -d "$DIR" ]
then
    echo "raju dir exist."
else
    echo "Raju dir not exist."
fi

FILES=$(find ${SOURCE_DIR} -type f -mtime +14)
echo "Files: $FILES"