#!/bin/bash

while true 
do
	echo `date` >> staging.log
        echo '\s bulk request ls -l' | ssh -p 24223 admin@fndcatemp2.fnal.gov 2> /dev/null >> staging.log
        echo '\s bulk,qos-verifier info' | ssh -p 24223 admin@fndcatemp2.fnal.gov 2> /dev/null >> staging.log
	
	if test -f "stop"; then
                echo "stopping ..." >> staging.log
                exit 0
        fi
	echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" >> staging.log
        echo "" >> staging.log
        sleep 60
done
