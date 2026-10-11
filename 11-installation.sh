#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "Run the script with, root access"
    exit 1
else
    echo "user is having root access"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "mysql is not instlled. going to install"
    dnf install mysql -y
    if [ $? -ne 0 ]
    then 
        echo "Mysql installation failed. pls check"
        exit 1
    else
        echo "Mysql installation success"
    fi    
else
    echo "mysql already installed. Nothing to do"
fi