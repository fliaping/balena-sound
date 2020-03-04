#!/bin/bash
FILE=/run/sound/bluetooth/snapfifo

while sleep 3; do
    if [ -p "$FILE" ]; then
        echo "$FILE exist"
        chmod +x /usr/src/create_fifo_with_size
        /usr/src/create_fifo_with_size.sh $FILE 8192
        # ffplay -f s16le -ar 44.1k -ac 2 $FILE -autoexit -nodisp
        play -t raw -r 44.1k -e signed -b 16 -c 2 $FILE
    else 
        echo "$FILE does not exist, wait..."
    fi
done