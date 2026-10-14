#!/bin/bash
DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOULD=5

while IFS= read -r line
do    
    USAGE=$(echo $line | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)
    PARTITION=$(echo $line | grep xfs | awk -F " " '{print $NF}')
    if [ $USAGE -ge $DISK_THRESHOULD ]
    then
        echo "$PARTITION is greater than $ DISK_THRESHOULD and currect value is $USAGE"
    fi
done <<< $DISK_USAGE