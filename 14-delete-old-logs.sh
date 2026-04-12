#!/bin/bash 

FILES_TO_DELETE=$(find $SOURCE_DIR -type f -mtime +14)


echo "Please enter the source Directory: "
read DIRECTORY

if [ ! -d $DIRECTORY ] # ! - denotes not exist
then 
    echo " ERROR: The Source Directory : $DIRECTORY is not found"
else 
