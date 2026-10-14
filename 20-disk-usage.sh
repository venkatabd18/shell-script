#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOULD=5

while IFS= read -r line
do
    echo "$line"

done <<< $DISK_USAGE