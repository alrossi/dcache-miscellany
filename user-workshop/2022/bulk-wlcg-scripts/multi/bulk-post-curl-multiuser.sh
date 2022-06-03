#!/bin/bash


function submit () {
	USER="--user test$2$3:dickerelch$2$3"

	curl -k -v $USER -X POST "https://fndcatemp2.fnal.gov:3880/api/v1/bulk-requests" -H "accept: application/json" -H "content-type: application/json" -d @filesets/$1$2$3.json
}


for job in `seq ${1} ${2}`
do
	for i in `seq 0 9`
	do
		for j in `seq 0 9`
		do
			submit $job $i $j
			sleep 5
		done
	done
done


