if [ -n "$2" ] ; then
	curl `curl-user` -X POST "https://fndcatemp2.fnal.gov:3880/api/v1/stage/${1}/cancel" -H "accept: application/json" -H "content-type: application/json" -d $2
else
	curl `curl-user` -X PATCH "https://fndcatemp2.fnal.gov:3880/api/v1/bulk-requests/${1}" -H "accept: application/json" -H "content-type: application/json" -d '{"action":"cancel"}'
fi
