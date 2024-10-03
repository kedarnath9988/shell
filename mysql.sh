#!/bin/bash

USER=$( id -u )
TIME_STAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE=$SCRIPT_NAME-$TIME_STAMP.log
echo "current script name is :"$SCRIPT_NAME


if [ $USER -eq 0 ]
then    
    echo " you are the super user"
else    
    echo " you needed super user access to do this"
    ecit 1 # manually exiting 
fi 


