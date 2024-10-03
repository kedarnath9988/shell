#!/bin/bash 

USER=$( id -u )
TIME_STAMP=$( date +%f-%H-%M-%S )
SCRIPT_NAME=$(echo $0 | cut -d "." / -f1 )
LOG_FILE=/tmp/$SCRIPT_NAME-$TIME_STAMP.log
#colours enbling 
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo "script name is :"$LOG_FILE
if [ $USER -eq 0 ]
then 
    echo -e " $G you are sudo user $N "
else
    echo  -e " $R need super user access to do $N "
fi 

echo "all packees :" $@

validate()
    if [ $1 -eq 0 ]
    then
        echo -e " $G  $2 installed successfully $N  "
    else
        echo -e  "$R  $2 not installed successfully $N "
        exit 1 # manually exiting 
    fi 
#loop 
for i in $@
do 
    echo "pakages to install ::"$i 
    dnf list installed $i &>> LOG_FILE
    if [ $? -eq 0 ]
        then 
            echo -e " $Y $i is already installed skipping  $N "
        else 
         echo  -e " $R $i need to be install  $N " 
         dnf install $i -y &>> LOG_FILE
         validate $? "installing $i"
    fi    
done


