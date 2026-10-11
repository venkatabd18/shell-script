#!/bin/bash

echo "Scrit name is $0"
echo "exit status is $?"
echo "PID currected script $$"
sleep 60 &
echo "PID of last bckground script $!"
echo "Number of aruguments/variables passed in the script $#"