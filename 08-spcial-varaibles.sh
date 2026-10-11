#!/bin/bash

echo "Scrit name is $0"
echo "exit status is $?"
echo "PID currected script $$"
sleep 60 &
echo "PID of last bckground script $!"
echo "Number of arguments/variables passed in the script $#"
echo "All arguments/variables passed in the script $@"