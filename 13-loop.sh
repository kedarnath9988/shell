#!/bin/bash 
count=0
for i in {1..20}
do  echo $i 
    count= $count+ $i
done
echo "total count is " $count