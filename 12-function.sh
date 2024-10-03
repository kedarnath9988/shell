#!/bin/bash

USER=$( id -u )
TIMESTAMP=$( date +%F-%H-%M-%S )
SCRIPT_NAME=(echo $0 | cut -d "." -f1)

echo "time "  $TIMESTAMP
echo " current script nam eis " $SCRIPT_NAME
