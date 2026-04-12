#!/bin/bash 

SOURCE_DIR=$1
FILES_TO_DELETE=$(find $SOURCE_DIR -type f -mtime +14)


echo "Please enter the source Directory: "

if [ ! -d $SOURCE_DIR ] # ! - denotes not exist
then 
    echo " ERROR: The Source Directory : $SOURCE_DIR is not found"
else 
