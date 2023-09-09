#!/bin/bash


list=`find . -type d`

#echo ${list}


for file in ${list}; do
    echo "Processing: ${file}"

   if [[ ${file} != "." ]]
   then
       echo "OK to process: ${file}"
       cd ${file}
       rm *~
       rm *.o
       rm System*.c
       rm *.libs
       rm *.log
       rm *.makefile
       rm *.h
       rm *.json
       rm *.xml
       rm System_res.mat
       rm System
       cd ..
   fi
done


