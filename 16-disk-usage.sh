#!/bin/bash 

DISK_USAGE=$(df -hT | grep -vE 'tmp|File|efi')
THRESHOLD=25%
MESSAGE=""
IP_ADDRESS=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

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
        MESSAGE+="High Disk Usage on $VOLUME : $USAGE <br>"
    fi
done <<< $DISK_USAGE

echo -e "$MESSAGE"

# echo "Subject: High Disk Usage\n\n" "$MESSAGE" | msmtp premsagar.eri@devopsprocloud.in

# sh mail.sh "premsagar.eri@devopsprocloud.in" "High Disk Usage Alert" "$MESSAGE" "HIGH_DISK_USAGE"

# if [ -n "$MESSAGE" ]; then

# echo -e "Subject: High Disk Usage Alert
#          From: premsagar.eri@gmail.com
#          To: premsagar.eri@devopsprocloud.in

# $MESSAGE" | msmtp premsagar.eri@devopsprocloud.in

# fi

# echo -e "Subject: High Disk Usage Alert
# From: premsagar.eri@gmail.com
# To: premsagar.eri@devopsprocloud.in

# $MESSAGE" | msmtp premsagar.eri@devopsprocloud.in

# sh mail.sh "premsagar.eri@devopsprocloud.in" "High Disk Usage Alert on $IP_ADDRESS" "DevOps Team" "$MESSAGE" "High Disk Usage" "$IP_ADDRESS"

# To Address
# Subject
# To Team
# Body Message
# Alert Type
# IP Address

sh mail.sh "prem@gmail.com" "High Disk Usage on $IP_ADDRESS" "DevOps team" "$MESSAGE" "High Disk Usage" "$IP_ADDRESS"

