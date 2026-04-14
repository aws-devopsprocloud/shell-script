#!/bin/bash 

DISK_USAGE=$(df -hT | grep -vE 'tmp|File|efi')
THRESHOLD=25%
MESSAGE=""

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
        MESSAGE+="High Disk Usage on $VOLUME : $USAGE\n"
    fi
done <<< $DISK_USAGE

echo -e "$MESSAGE"

# echo "Subject: High Disk Usage\n\n" "$MESSAGE" | msmtp premsagar.eri@devopsprocloud.in

# sh mail.sh "premsagar.eri@devopsprocloud.in" "High Disk Usage Alert" "$MESSAGE" "HIGH_DISK_USAGE"

if [ -n "$MESSAGE" ]; then

echo -e "Subject: High Disk Usage Alert
From: premsagar.eri@gmail.com
To: premsagar.eri@devopsprocloud.in

$MESSAGE" | msmtp premsagar.eri@devopsprocloud.in

fi

