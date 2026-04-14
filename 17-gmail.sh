#!/bin/bash 


ID=$(id -u)

if [$ID -ne 0 ]
then 
    echo "Please run this script with root user"
else 
    sudo dnf install msmtp -y

    sudo cp /home/ec2-user/shell-script/msmtprc /etc/msmtprc

    sudo chmod 644 /etc/msmtprc

    sudo touch /var/log/msmtp.log

    sudo chmod 666 /var/log/msmtp.log
fi