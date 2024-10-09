#!/bin/bash 

COURSE="DevOps for the current script"

echo "before calling the other script "$COURSE
echo "pid of  the current script"$$

./16-another-script.sh

echo "After calling the other script "$COURSE
echo "pid of  the current script" $$
