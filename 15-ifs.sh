#!/bin/bash 

FILE=/etc/passwd 

if  [ ! -f $FILE ]
then 
    echo "ERROR: The file does not exist"
else 
    echo "reading the file"
    while IFS=":" read -r f1 f2 f3 f4 f5 f6 f7
    do 
        echo "Username : $f1"
        echo "User ID : $f3"
        echo "Home Directory : $f6"
        # echo "Shell : $f7"
    done < $FILE # use single < to insert the files; triple <<< to insert folder/directory;
fi