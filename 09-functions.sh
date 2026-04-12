#!/bin/bash

ID=$(id -u)
DATE=$(date +%F-%H-%M-%S)
LOGFILE=/tmp/$0-$DATE.log

echo "Script started executing at $DATE"

# FUNCTION ---------

VALIDATE () {
    if [ $1 -ne 0 ]
        then
            echo "ERROR: Installing $2 is FAILED"
        else 
            echo "Installing $2 is SUCCESS"
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
        VALIDATE $? "MySQL"
        
    else 
        echo "MySQL is already installed"
    fi
    yum list installed | grep nginx &>> $LOGFILE
    if [ $? -ne 0 ]
    then 
        yum install nginx -y &>> $LOGFILE
        VALIDATE $? "NGINX"
        
    else 
        echo "NGINX is already installed"
    fi
fi 

