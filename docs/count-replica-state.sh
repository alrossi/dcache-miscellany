#!/bin/bash

if [ -z $1 ] ; then
	echo "Please indicate pool name"
	exit 1
fi

echo "CACHED+STICKY"
echo "\s $1 rep ls" | ssh -p 24223 admin@fndcatemp1.fnal.gov 2> /dev/null | egrep "<*-------X" | wc -l

echo "CACHED"
echo "\s $1 rep ls" | ssh -p 24223 admin@fndcatemp1.fnal.gov 2> /dev/null | grep "<C--------" | wc -l

echo "PRECIOUS"
echo "\s $1 rep ls" | ssh -p 24223 admin@fndcatemp1.fnal.gov 2> /dev/null | grep "<-P" | wc -l

