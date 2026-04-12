#!/bin/bash 

ID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

DATE=$(date +%F-%H-%M-%S)

LOGFILE=/tmp/$0-$DATE.log

VALIDATE () {
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 uninstallation $R FAILED $N"
    else 
        echo -e "$2 uninstallation $G SUCCESS $N"
    fi
}

if [ $ID -ne 0 ]
then 
    echo -e "$R ERROR: $N Please run this script with root access"
else 
    for PACKAGE in $@
    do 
        yum list installed $PACKAGE &>> $LOGFILE
        if [ $? == 0 ]
        then 
            yum remove $PACKAGE -y | tee -a $LOGFILE
            VALIDATE $? "$PACKAGE"
        else 
            echo -e "$Y $PACKAGE does not exist $N"
        fi
    done
fi