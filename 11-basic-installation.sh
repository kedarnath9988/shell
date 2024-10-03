#!/bin/bash 

USER=$( id -u )

if [ $USER -eq 0 ]
then
    echo " you are the super user "
else
    echo " you are not super user " 
fi 

echo " value of USER is " $USER


dnf remove maven -y 

if [ $? -eq 0 ]
then 
    echo " maven removed  successfully"
else
    echo " maven not installed"
fi 


dnf install git -y 

if [ $? -eq 0 ]
then
    echo "git installed successfully"
else
    echo "git not installed"
fi 


