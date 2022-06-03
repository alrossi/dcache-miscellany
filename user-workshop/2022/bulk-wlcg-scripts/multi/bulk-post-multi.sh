#!/bin/bash

for j in `seq 0 9`
do
for k in `seq 0 9`
do
	echo "\s bulk request submit -activity=DELETE -expandDirectories=TARGETS -prestore /pnfs/fs/usr/test/arossi/persistent/$1$j$k" | ssh -p 24223 admin@fndcatemp2.fnal.gov 2> /dev/null
done
done

