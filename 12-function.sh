#!/bin/bash

USER=$( id -u )
TIMESTAMP=$( date +%F-%H-%M-%S )
SCRIPT_NAME=echo( echo $0 | cut -d "." -f1 )

echo $TIMESTAMP
echo $SCRIPT_NAME
