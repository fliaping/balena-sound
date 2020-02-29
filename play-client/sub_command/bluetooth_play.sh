#!/bin/bash
FILE=/var/cache/snapcast/snapfifo

while sleep 3; do
    if [ -f "$FILE" ]; then
        echo "$FILE exist"
        ffplay -f s16le -ar 44.1k -ac 2 $FILE
    else 
        echo "$FILE does not exist, wait..."
    fi
done