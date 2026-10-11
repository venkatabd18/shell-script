#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "Run the script with, root access"
else
    echo "user is having root access"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "mysql is not instlled. going to install"
else
    echo "mysql already installed. Nothing to do"
fi