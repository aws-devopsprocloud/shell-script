#!/bin/bash 

IP_ADDRESS=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

echo "Please enter the source Directory: "
read DIRECTORY

if [ ! -d $DIRECTORY ] # ! - denotes not exist
then 
    echo " ERROR: The Source Directory : $DIRECTORY is not found"
    exit 1
else 
    echo "Source Directory : $DIRECTORY exist"
    FILES_TO_DELETE=$(find $DIRECTORY -type f -mtime +14 -name "*.log")
    while IFS= read -r line 
    do 
        echo -e "Deleted : $line"
        rm -rf $line
    done <<< $FILES_TO_DELETE # use single < to insert the files; triple <<< to insert folder/directory;
fi

sh mail.sh "premsagar.eri@devopsprocloud.in" "Old Logs deletion on $IP_ADDRESS" "DevOps team" "$line" "Old Logs Deletion" "$IP_ADDRESS"
# To Address
# Subject
# To Team
# Body Message
# Alert Type
# IP Address