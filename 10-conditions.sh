#!/bin/bash
#create user Venkat if not available.

id venkat
if [ $? -ne 0 ]
then
    echo "Username not exit. creating"
    useradd venkat
else
    echo "Username already exist. nothing to do.."
fi