#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
mkdir -p $LOGS_FOLDER
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE=$LOGS_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log

USERID=$(id -u)
CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then 
        echo -e "$Y Run the script wit root access $N" | tee $LOG_FILE
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is $R FAILED $N" | tee $LOG_FILE
    else
        echo "$2 is $G SUCCESS $N" | tee $LOG_FILE
    fi
}

CHECK_ROOT

for package in $@
do
    dnf list installed $package &>> $LOG_FILE
    if [ $? -ne 0 ]
    then
        echo -e "$Y $package not installed $N. Installing now" | tee $LOG_FILE
        dnf install $package -y &>> $LOG_FILE
        VALIDATE $? "Install $package"
    else
        echo -e "$Y $package already installed. nothing to do $N." | tee $LOG_FILE
    fi
done
