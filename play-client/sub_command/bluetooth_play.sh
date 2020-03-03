#!/bin/bash
FILE=/run/sound/bluetooth/snapfifo

while sleep 3; do
    if [ -p "$FILE" ]; then
        echo "$FILE exist"
        ffplay -f s16le -ar 44.1k -ac 2 $FILE -autoexit -nodisp
    else 
        echo "$FILE does not exist, wait..."
    fi
done