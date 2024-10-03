#!/bin/bash

USER=$( id -u )
TIME_STAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$( echo $0 | cut -d "." -f1)
LOG_FILE=/tmp/$SCRIPT_NAME-$TIME_STAMP.log 
# enabling colours 
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


echo "script started excutation at "$LOG_FILE

validate(){
    if [ $1 -eq 0 ]
    then 
        echo -e  " $G instaling $2 Successfully $N  "
    else
        echo -e  " $R  instaling $2 failed $N "
        exit 1 
    fi 
}

if [ $USER -eq 0 ]
then
    echo -e  " $G  you are super user $N "
else
    echo  -e " $R  need super-user Access to do $N  "
    exit 1 
fi 

dnf install git -y   &>> $LOG_FILE
validate $? "intalling git"  

dnf install nginx -y &>> $LOG_FILE
validate $? "intalling nginx" 

dnf install maven -y  &>> $LOG_FILE
validate $? "intalling maven" 

dnf install dockerr -y  &>> $LOG_FILE
validate $? "intalling docker " 