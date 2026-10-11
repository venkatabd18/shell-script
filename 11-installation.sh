#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "Run the script with, root access"
else
    echo "user is having root access"
fi