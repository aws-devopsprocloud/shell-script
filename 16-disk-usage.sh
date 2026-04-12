#!/bin/bash 

DISK_USAGE=$(df -hT | grep -vE 'tmp|File|efi')
THRESHOLD=25 
MESSSAGE=""

# If disk usage is more than the threshold then 

while IFS= read -r line 
do 
    USAGE=$(df -hT | grep -vE 'tmp|File|efi' | awk '{print $6F}')
    VOLUME=$(df -hT | grep -vE 'tmp|File|efi' | awk '{print $1F}')
    echo "High Disk Usage on $VOLUME : $USAGE"

done <<< $DISK_USAGE