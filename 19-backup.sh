#!/bin/bash
SOUR_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%s)

UASAGE(){
    echo -e "$Y Usage::19-backup <source> <destination> <no.of days (optinal)> $N"
}

if [ $# -lt 2 ]
then 
    UASAGE
fi 

if [ ! -d $SOUR_DIR ]
then 
    echo -e "$R Source does not exist $N .. Pls check"
    exit 1
fi

if [ ! -d $DEST_DIR ]
then 
    echo -e "$R destinatio does not exist $N .. Pls check"
    exit 1
fi

FILES=$(find $SOUR_DIR -name "*.log" -mtime +$DAYS)
echo "Files are: $FILES"

if [[ -z $FILES ]]
then 
    echo -e "$Y No files whic are older than 14 days $N"
    exit 1
else
    echo -e "$G Files are exist $N"
    ZIP_FILE=$DEST_DIR/app-log-$TIME_STAMP.zip
    find $SOUR_DIR -name "*.log" -mtime +$DAYS | zip $ZIP_FILE -@
    if [ -f $ZIP_FILE ]
    then
        echo "Zipping is success"
        while IFS= read -r file
        do 
            echo "deleting file is $file"
            rm -rf $file
        done <<< $FILES
    else
        echo "Zipping is failed. pls check"
        exit 1
    fi
fi
