#!/bin/bash
chmod +x /usr/src/airplay_play.sh
chmod +x /usr/src/bluetooth_play.sh
chmod +x /usr/src/wukong_play.sh

# Start the first process
/usr/src/airplay_play.sh &
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start my_first_process: $status"
  exit $status
fi

# Start the second process
/usr/src/bluetooth_play.sh &
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start my_second_process: $status"
  exit $status
fi

# Start the third process
/usr/src/wukong_play.sh &
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start my_second_process: $status"
  exit $status
fi

# Naive check runs checks once a minute to see if either of the processes exited.
# This illustrates part of the heavy lifting you need to do if you want to run
# more than one service in a container. The container exits with an error
# if it detects that either of the processes has exited.
# Otherwise it loops forever, waking up every 60 seconds

while sleep 3; do
  ps aux |grep airplay_play |grep -q -v grep
  PROCESS_1_STATUS=$?
  ps aux |grep bluetooth_play |grep -q -v grep
  PROCESS_2_STATUS=$?
  ps aux |grep wukong_play |grep -q -v grep
  PROCESS_3_STATUS=$?
  # If the greps above find anything, they exit with 0 status
  # If they are not both 0, then something is wrong
  if [ $PROCESS_1_STATUS -ne 0 -o $PROCESS_2_STATUS -ne 0 -o $PROCESS_3_STATUS -ne 0 ]; then
    echo "One of the processes has already exited. airplay_play:$PROCESS_1_STATUS, bluetooth_play:$PROCESS_2_STATUS, wukong_play:$PROCESS_3_STATUS"
    exit 1
  fi
done