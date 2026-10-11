#!/bin/bash
R="\e[31m"
G="\e[32m"
N="\e[0m"

SOURCE_DIR=/home/ec2-user/shell-script/raju

if [ -d $SOURCE_DIR ]
then
    echo -e "Source dir $G exist $N"
else 
    echo -e "Source dir $R not exist $N"
fi

FILES=$(find ${SOURCE_DIR} -name "*.txt" -mtime +14)

echo "files : $FILES"
