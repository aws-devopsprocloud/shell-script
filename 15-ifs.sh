#!/bin/bash 

FILE=/etc/passwd 

if  [ ! -f $FILE ]
then 
    echo "ERROR: The file does not exist"
else 
    echo "reading the file"
    while IFS=":" read -r f1 f2 f3 f4 f5 f6
    do 
        echo "Username : $f1"
        echo "USer ID: $f3"
    done <<< $FILE

fi