#!/bin/bash
SOUR_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}

UASAGE(){
    echo "Usage::19-backup <source> <destination> <no.of days (optinal)>"
}

if [ $# -lt 2 ]
then 
    UASAGE
fi 
