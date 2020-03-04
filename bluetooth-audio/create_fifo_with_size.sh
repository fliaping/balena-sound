#!/usr/bin/env python3

# Usage: ./create_fifo_with_size.sh /tmp/my.fifo  8192

import os
import fcntl
import sys

F_SETPIPE_SZ = 1031  # Linux 2.6.35+
F_GETPIPE_SZ = 1032  # Linux 2.6.35+

def change_fifo_size(fifo, size):
    try:
        print("change fifo file:"+fifo+" to size:"+size)
        fifo_fd = os.open(fifo, os.O_RDONLY|os.O_NONBLOCK)
        print(fifo_fd)
        print("Pipe size            : "+ str(fcntl.fcntl(fifo_fd, F_GETPIPE_SZ)))
        fcntl.fcntl(fifo_fd, F_SETPIPE_SZ, size)
        print("Pipe (modified) size : "+ str(fcntl.fcntl(fifo_fd, F_GETPIPE_SZ)))
        os.close(fifo_fd)
    except Exception as e:
        print ("Unable to change fifo size, error: "+ str(e))

def create_fifo_file(fifo):
    try:
        print("create fifo file:" + fifo)
        os.mkfifo(fifo)
    except Exception as e:
        print ("Unable to create fifo size, error: "+ str(e))

path = sys.argv[1]
size = sys.argv[2]
create_fifo_file(path)
change_fifo_size(path, size)
