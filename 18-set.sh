#!/bin/bash
set -e
failure(){
    echo "failed at $1:$2"
}

trap 'failure "${LINENO}" "$BASH_COMMAND"' ERR
echo "Hello world"
echoo "Hello world from failure"
echo "After failed"