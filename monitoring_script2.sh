#!/bin/bash
NOW=$(date -u +%s)
let RECENT=99999999
for FILE in `ls /object_storage/consul_backup/*.snap 2>/dev/null`; do
  # FILEDATE=$(stat -c %Z $FILE)
FILE=$(basename $FILE) 
FILEDATE=${FILE:7:10}   
FILELIFE=$(expr $NOW - $FILEDATE)
   if [ $RECENT -gt $FILELIFE ] ; then 
      RECENT=$FILELIFE
   fi
done 

if [ $RECENT -gt 3600 ] ; then 
   echo 0
else 
   echo 1
fi
