#!/bin/bash

ID=$(id -u)
DATE=$(date +%H-%M-%S)
LOGFILE=/tmp/$0-$DATE.log

VALIDATE () {
    if [ $? -ne 0 ]
        then
            echo "ERROR: Installing MySQL is FAILED"
        else 
            echo "Installing MySQL is SUCCESS"
        fi
}

if [ $ID -ne 0 ]
then 
    echo "ERROR: Please run this command with Root permissions"
    exit 1
else 
    yum list installed | grep mysql &>> $LOGFILE
    if [ $? -ne 0 ]
    then 
        yum install mysql -y &>> $LOGFILE
        VALIDATE 
        
    else 
        echo "MySQL is already installed"
    fi
fi 

