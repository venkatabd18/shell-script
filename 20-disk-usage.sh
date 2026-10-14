#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5

while IFS= read -r line
do
    UASAGE=$(df -hT | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)
    PARTITION=$(df -hT | grep xfs | awk -F " " '{print $NF}')
    if [ $UASAGE -gt $DISK_THRESHOULD ]
    then
        echo "$PARTITION is more than $DISK_THRESHOLD, current value: $USAGE. Please check"
    fi
done <<< $DISK_USAGE