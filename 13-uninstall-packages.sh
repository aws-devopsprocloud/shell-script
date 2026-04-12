#!/bin/bash 

ID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


VALIDATE () {
    if [ $1 -ne 0 ]
    then 
        echo "$2 uninstallation $R FAILED $N"
    else 
        echo "$2 uninstallation $G SUCCESS $N"
    fi
}


for PACKAGE in $@
do 
    yum list installed $PACKAGE
    if [ $? == 0 ]
    then 
        yum remove $PACKAGE -y 
        VALIDATE $? "$PACKAGE"
    else 
        echo "$PACKAGE does not exist"
    fi
done