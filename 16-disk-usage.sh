#!/bin/bash 

DISK_USAGE=$(df -hT | grep -vE 'tmp|File|efi')
THRESHOLD=25%
MESSSAGE=""

# If disk usage is more than the threshold then 

while IFS= read -r line 
do 
    # USAGE=$(echo $line | awk '{print $6F}' | cut -d % -f1)
    USAGE=$(echo $line | awk '{print $6F}')
    VOLUME=$(echo $line | awk '{print $1F}')
    
    # if [ $USAGE -gt "$THRESHOLD" ]
    if (( ${USAGE%\%} > ${THRESHOLD%\%} ))
    then 
        # echo "High Disk Usage on $VOLUME : $USAGE"
        MESSSAGE="High Disk Usage on $VOLUME : $USAGE"
    fi
done <<< $DISK_USAGE