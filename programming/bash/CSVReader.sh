#!/bin/bash
OLDIFS=$IFS
IFS=";"
while read user job uid location
 do

    echo -e "$user \
    ======================\n\
    Role :\t $job\n\
    ID :\t $uid\n\
    SITE :\t $location\n"
 done < $1
 IFS=$OLDIFS