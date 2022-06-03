#!/bin/bash

TAPE_POOLS="dcatest03-5,dcatest03-7,dcatest04-5,dcatest04-7,dcatest08-5,dcatest09-5"

for id in `cat ${1}`
do
	echo "\s $TAPE_POOLS rep rm -force $id" | ssh -p 24223 admin@fndcatemp2.fnal.gov &> /dev/null
	echo $id >> purged.txt
done
