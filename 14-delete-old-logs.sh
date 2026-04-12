#!/bin/bash 




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
        echo "Deleting : $line"
        # rm -rf $line
    done <<< $FILES_TO_DELETE
fi