#!/bin/bash

ID=(id -u)

if [ $ID -ne 0 ]
then 
    echo "Run this command with Root permissions"
else 
    yum list installed | grep nginx 
    if [ $? -ne 0 ]
    then 
        yum install nginx -y 
    else 
        echo "Nginx is already installed"
    fi
fi 

