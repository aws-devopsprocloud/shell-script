#!/bin/bash

echo "What is today ?"

read TODAY

if [ $TODAY -ne "Sunday" ]
then 
    echo "Today is $TODAY not a Holiday, Go to School"
else
    echo "Today is $TODAY, Happy Holiday."
fi

