#!/bin/bash 

echo "to print all  params "$@

echo " count no of  params"$#

echo "to print the shell script name ia "$0

echo "to knoe the current user "$USER

echo "to konw the current working directory " $PWD 

echo " to know the home directory of the current user is " $HOME 

echo "to know the hostname of the OS is " $HOST

echo " to know the pid of the current shell script is "$$ 

sleep 10 

echo "to know the exit-status  previous commad is " $? 

touch hello.txt 

echo "to know the exit-status previous commad is " $? 



