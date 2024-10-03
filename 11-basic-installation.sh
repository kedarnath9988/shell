#!/bin/bash 

USER=$( id -u )

if [ $USER -eq 0 ]
then
    echo " you are the super user "
else
    echo " you are not super user " 
fi 

echo " value of USER is " $USER