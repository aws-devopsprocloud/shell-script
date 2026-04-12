#!/bin/bash

ID=$(id -u)
DATE=$(date +%F-%H-%M-%S)
LOGFILE=/tmp/$0-$DATE.log

echo "Script started executing at $DATE"

# USING MULTIPLE FUNCTIONS ---------

VALIDATE () {
    if [ $1 -ne 0 ]
        then
            echo "ERROR: Installing $2 is FAILED"
        else 
            echo "Installing $2 is SUCCESS"
        fi
}

VALIDATE1 () {
    if [ $1 -ne 0 ]
    then 
        yum install $2 -y &>> $LOGFILE
        VALIDATE $? "$2"
        
    else 
        echo "$2 is already installed"
    fi
}    

if [ $ID -ne 0 ]
then 
    echo "ERROR: Please run this command with Root permissions"
    exit 1
else 
    for PACKAGE in $@ 
    do
        yum list installed $PACKAGE &>> $LOGFILE
        VALIDATE1 $? "$PACKAGE"
    done
fi 

