if [ -n "$1" ] ; then
	curl `curl-user` -X GET "https://fndcatemp2.fnal.gov:3880/api/v1/bulk-requests/$1?offset=$2" -H "accept: application/json"
else
	curl `curl-user` -X GET "https://fndcatemp2.fnal.gov:3880/api/v1/bulk-requests" -H "accept: application/json"
	echo ""
fi
