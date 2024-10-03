#!/bin/bash 

USER=$( id -u )


if [ $USER -eq 0 ]
then 
    echo "  you are sudo user "
else
    echo " need super user access to do "
fi 

echo "all packees" $@


