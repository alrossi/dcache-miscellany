#!/bin/bash

if [ -z $1 ] ; then
   echo "No data file"
   exit 1
fi

ADMIN=admin@fndcatemp1.fnal.gov
FILES=`cat $1`
LOCS=
REPS=

for f in $FILES 
do 
	LOCS=`echo "\sn cacheinfoof $f" | ssh -p 24223 $ADMIN 2> /dev/null`
	for l in $LOCS
	do 
	    echo $l
            echo "\s $l rep ls $f" | ssh -p 24223 $ADMIN 2> /dev/null
        done
done

