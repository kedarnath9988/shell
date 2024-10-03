#!/bin/bash

USER=$( id -u )
TIME_STAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE=/tmp/$SCRIPT_NAME-$TIME_STAMP.log 

validate(){
    if [ $1 -eq 0 ]
    then 
        echo "instaling $2 Successfully "
    else
        echo " instaling $2 failed"
        exit 1 
    fi 
}
validate(){
    if [ $1 -eq 0 ]
    then 
        echo "instaling $2 Successfully "
    else
        echo " instaling $2 failed"
        exit 1 
    fi 
}
if [ $USER -eq 0 ]
then
    echo " you are super user"
else
    echo " need super-user Access to do "
    exit 1 
fi 

dnf install git -y  
validate $? "intalling git"  &>> $LOG_FILE

dnf install nginx -y 
validate $? "intalling nginx" &>> $LOG_FILE

dnf install maven -y 
validate $? "intalling maven" &>> $LOG_FILE
