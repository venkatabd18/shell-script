#!/bin/bash

DIR=/home/ec2-user/shell-script/raju

if [ -d "$DIR" ]
then
    echo "raju dir exist."
else
    echo "Raju dir not exist."
fi

FILES=$(find $(DIR) -type f -mtime +14)
echo "Files: $FILES"