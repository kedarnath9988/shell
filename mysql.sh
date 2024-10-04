#!/bin/bash

USER=$( id -u )
TIME_STAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE=/tmp/$SCRIPT_NAME-$TIME_STAMP.log

# enabling the colours 
R="\e[31m"
Y="\e[32m"
G="\e[33m"
N="\e[0m"

if [ $USER -eq 0 ]
then    
    echo  -e "$G  you are the super user $N "
else    
    echo -e  "$R you needed super user access to do this $N"
    ecit 1 # manually exiting 
fi 

# redireccting by defautly only success command is redirecting to the log file by giving 1> 
# redireccting  failure  command is redirecting to the log file by giving 2>
# But we need to redirecting both the success and failure must provide &>> 


validate()
    if [ $1 -eq 0 ]
    then
        echo -e "$G $2 done successfully ..$N"
    else 
        echo  -e "$R $2  failure $N "
        exit 1 
    fi 

dnf install mysql-server -y &>> $LOG_FILE
validate $? "installing mysql-server"

systemctl enable mysqld  &>> $LOG_FILE
validate $? "enabling mysql"

systemctl start mysqld  &>> $LOG_FILE
validate $? "starting mysql".

mysql -h db.dawskedarnath.online -u root -pExpenseApp@1 -e "SHOW DATABASES;"
if [ $1 -eq 0 ]
    then
        echo -e "$G $2 done successfully ..$N"
    else 
        echo  -e "$R $2  failure $N "
        mysql_secure_installation --set-root-pass ExpenseApp@1 &>> $LOG_FILE
        validate $? "setting up the root password"
         
    fi


# mysql_secure_installation --set-root-pass ExpenseApp@1 &>> $LOG_FILE
# validate $? "setting up the root password"

