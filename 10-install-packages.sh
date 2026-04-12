#!/bin/bash

ID=$(id -u)
DATE=$(date +%F-%H-%M-%S)
LOGFILE=/tmp/$0-$DATE.log
#PACKAGE=("mysql", "nginx", "postfix")

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

VALIDATE1 () {
    if [ $1 -ne 0 ]
    then 
        yum install $2 -y &>> $LOGFILE
        VALIDATE $? "$PACKAGE"
        
    else 
        echo "$PACKAGE is already installed"
    fi
}    

if [ $ID -ne 0 ]
then 
    echo "ERROR: Please run this command with Root permissions"
    exit 1
else 
    for PACKAGE in $@ 
    do
        yum list installed | grep $PACKAGE &>> $LOGFILE
        VALIDATE1 $? "$PACKAGE"
    done

    #     yum list installed | grep nginx &>> $LOGFILE
    #     VALIDATE1 $? "$PACKAGE"
    # for PACKAGE in $@ 
    # do 
    #     yum list installed $PACKAGE &>> $LOGFILE
    #     if [ $? -ne 0 ] # If not installed
    #     then
    #         yum install $package -y &>> $LOGFILE # install the package
    #         VALIDATE $? "Installing $package" # validate 
    #     else
    #         echo -e "$package is already installed...$Y SKIPPING $N." # If installed already give the output
    #     fi
    # done
fi 

