#!/bin/bash

USER=$( id -u )
TIMESTAMP=$( date +%F-%H-%M-%S )
SCRIPT_NAME=echo( $0 | cut -d "." -f1 )

echo $TIMESTAMP
echo $SCRIPT_NAME



validate(){
    if [ $1 -eq 0 ]
    then
        echo " $2  installed successfully ...."
    else
        echo "not installed $2 .."
        exit 1 # manually exiting the script 
    fi 
}

if [ $USER -eq 0 ]
then
    echo "you are super user"
else 
    echo "need super-user Access"
    exit 1 # manually exiting the script 
fi 

dnf install git -y 
validate $? git 


dnf install maven -y 
validate $? maven 

dnf install vim -y 
validate $? vim  




