#!/bin/bash


THRESHOLD=$1
LOGFILE="/var/log/disk.log"


USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')


if [ "$USAGE" -ge "$THRESHOLD" ]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') WARNING: Disk usage at ${USAGE}% exceeds threshold of ${THRESHOLD}%" >> "$LOGFILE"
fi
