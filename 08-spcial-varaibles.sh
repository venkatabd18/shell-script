#!/bin/bash

echo "Scrit name is $0"
echo "exit status is $?"
echo "Number of arguments/variables passed in the script $#"
echo "All arguments/variables passed in the script $@"
echo "First argument passed $1"
echo "Currect working directory of user $PWD"
echo "Home directory of currect user $HOME"
echo "PID current script $$"
sleep 60 &
echo "PID of last bckground script $!"