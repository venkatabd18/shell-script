#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)
CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then 
        echo -e "$Y Run the script wit root access $N"
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is $R FAILED $N"
    else
        echo "$2 is $G SUCCESS $N"
}

CHECK_ROOT

for package in $@
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo -e "$Y $package not installed $N. Installing now"
        dnf install $package -y
        VALIDATE $? "Install $package"
    else
        echo -e "$Y $package already installed. nothing to do $N."
    fi
done
