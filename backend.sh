#!/bin/bash 

USER=$( id -u )
TIME_STAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$( echo $0 | cut -d "." f1 )
LOG_FILE=/tmp/$SCRIPT_NAME-$TIME_STAMP.log 
# enabling the colours 
R="\e[31m"
Y="\e[32m"
G="\e[33m"
N="\e[0m"

if [ $USER -eq 0 ]
then 
    echo " you are the super-user"
else
    echo " need super-user to do this"
    exit 1 # manually exiting 
fi
validate()
    if [ $1 -eq 0 ]
    then
        echo -e "$2 .. done successfully $N "
    else
        echo "$2 .. failed .."
        exit 1 # manually exiting 
    fi 

dnf module disable nodejs:18 -y &>> LOG_FILE
validate $? "disabling the nodw.js"

dnf module enable nodejs:20 -y &>> LOG_FILE
validate $? "enabling the nodejs:20"

dnf install nodejs -y &>> LOG_FILE
validate $? "installing nodejs"

id expense 
if [ $? -eq 0 ]
then
    echo "user already exited"
else
    echo "user not existed need to create the Expense User"
    useradd expense
fi 

mkdir -p /app &>> LOG_FILE
validate $? "creating /app directory"

unzip /tmp/backend.zip &>> LOG_FILE
validate $? "unziping the backend code "

cd /app &>> LOG_FILE
validate $? "moving to the /app directory"

npm install &>> LOG_FILE
validate $? "installing the nodejs dependences"




