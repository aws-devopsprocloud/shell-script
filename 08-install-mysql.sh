#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then 
    echo "ERROR: Please run this command with Root permissions"
else 
    yum list installed | grep mysql 
    if [ $? -ne 0 ]
    then 
        yum install mysql -y 
    else 
        echo "MySQL is already installed"
    fi
fi 

