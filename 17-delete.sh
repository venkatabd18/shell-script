#!/bin/bash
R="\e[31m"
G="\e[32m"
N="\e[0m"

SOURCE_DIR=/home/ec2-user/expense

if [ -d $SOURCE_DIR ]
then
    echo -e "$G $SOURCE_DIR is exist $N"
else
    echo -e "$R $SOURCE_DIR does not exists $N"
    exit 1
fi

FILES=$(find /home/ec2-user/expense -name "*.log" -mtime +14)

echo "files are: $FILES"

while IFS= read -r file
do
    echo "deleting file is $file"
done <<< $FILES