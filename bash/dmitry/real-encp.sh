#!/bin/sh

set -u

OVERRIDE_PATH=1  # 1 to enable, 0 to disable the --override-path

# get example
# ~enstore/dcache-deploy/scripts/real-encp.sh  get 000200000000000000007A80  /tmp/x1 '-si=size=312;new=true;stored=false;sClass=test.dcache;cClass=-;hsm=enstore;alloc-size=309155;onerror=default;timeout=-1;flag-c=1:34677ad2;uid=5744;;path=<Unknown>;group=test;family=dcache;bfid=<Unknown>;volume=<unknown>;location=<unknown>;' -pnfs=/pnfs/fs -command=/home/enstore/dcache-deploy/scripts/real-encp2.sh

# '~enstore/dcache-deploy/scripts/real-encp.sh get 000063ADB93D23C84969B4C51C3DC3BB2CDB /diska/read-pool-1/data/000063ADB93D23C84969B4C51C3DC3BB2CDB -si=size=1073741824;new=false;stored=true;sClass=test.dcache;cClass=-;hsm=enstore;accessLatency=NEARLINE;retentionPolicy=CUSTODIAL;gid=3200;uid=8637;enstore://enstore/?volume=VOO534&location_cookie=0000_000000000_0002267&size=1073741824&file_family=dcache&original_name=/pnfs/fnal.gov/usr/test/litvinse/zero_data_lqcdsrm_dccp_1.data&map_file=&pnfsid_file=000063ADB93D23C84969B4C51C3DC3BB2CDB&pnfsid_map=&bfid=CDMS136605186900000&origdrive=stkenmvr216a:/dev/rmt/tps4d0n:1310065470&crc=0;;path=/pnfs/fnal.gov/usr/test/litvinse/zero_data_lqcdsrm_dccp_1.data;group=test;family=dcache;bfid=CDMS136605186900000;volume=VOO534;location=0000_000000000_0002267; -pnfs=/pnfs/fs -command=/usr/local/bin/real-encp.sh -uri=enstore://enstore/?volume=VOO534&location_cookie=0000_000000000_0002267&size=1073741824&file_family=dcache&original_name=/pnfs/fnal.gov/usr/test/litvinse/zero_data_lqcdsrm_dccp_1.data&map_file=&pnfsid_file=000063ADB93D23C84969B4C51C3DC3BB2CDB&pnfsid_map=&bfid=CDMS136605186900000&origdrive=stkenmvr216a:/dev/rmt/tps4d0n:1310065470&crc=0'

# put example
# /usr/local/bin/real-encp.sh put 001400000000000000B177C0 /data/write-pool-1/data/001400000000000000B177C0 '-si=size=4274832;new=true;stored=false;sClass=cms.cms4;cClass=-;hsm=enstore;path=/pnfs/fnal.gov/usr/cms/WAX/4/pnfs/fnal.gov/cms/PCP04/Digi/eg03_jets_2g_pt50170/jon.test.103;;path=<Unknown>;group=cms;family=cms4;bfid=<Unknown>;volume=<unknown>;location=<unknown>;' -pnfs=/pnfs/fs -command=/usr/local/bin/real-encp.sh

# /usr/local/bin/real-encp.sh put 00005FBD8F37A25941CBA3AB3AE25873B5E0 /diska/write-pool-1/data/00005FBD8F37A25941CBA3AB3AE25873B5E0 -si=size=83886080;new=true;stored=false;sClass=test.dcache;cClass=-;hsm=enstore;accessLatency=NEARLINE;retentionPolicy=CUSTODIAL;uid=-1;path=/pnfs/fnal.gov/usr/test/litvinse/go/fnisd1_c6f54a2e493411e2a3460019b9037377.data;gid=-1;StoreName=sql;;path=<Unknown>;group=test;family=dcache;bfid=<Unknown>;volume=<unknown>;location=<unknown>; -pnfs=/pnfs/fs -command=/usr/local/bin/real-encp.sh'
# remove example
#/usr/local/bin/real-encp.sh  remove -uri=enstore://enstore/?volume=VON589&location_cookie=0000_000000000_0075148&size=1024&file_family=dcache&original_name=/pnfs/fnal.gov/usr/eagle/dcache-tests/yujun/1kfile.1.2013Mar19145325&map_file=&pnfsid_file=0000AB4A74D3B1694EC49AA30D50211140C7&pnfsid_map=&bfid=CDMS136374786500000&origdrive=enmvr035:/dev/rmt/tps4d0n:1310260228&crc=0 -pnfs=/pnfs/fs -command=/usr/local/bin/real-encp.sh

f=/tmp/tmpOK$$
touch $f
out=/tmp/real-encp/`date +'%Y-%m-%d:%H:%M:%S'`.$$.$1.$2
rm $f

dir=`dirname $out`
if [ ! -d $dir ]; then mkdir $dir; fi
export out
exec >>$out 2>&1 <&-


LOGFILE=/var/log/dcache/real-encp.log
ERROR=/var/log/dcache/real-encp-error.log
SUCCESS=/var/log/dcache/real-encp-success.log

args="$*"
say() { if [ -n "${LOGFILE-}" ]; then  echo `date` ${node:-nonode} ${command:-nocmd} ${pnfsid:-noid} ${filepath:-nofilepath} $* >> $LOGFILE; fi
                                       echo `date` ${node:-nonode} ${command:-nocmd} ${pnfsid:-noid} ${filepath:-nofilepath} $*
      }
sayE() { if [ -n "${ERROR}" ];   then  echo `date` ${node:-nonode} ${command:-nocmd} ${pnfsid:-noid} ${filepath:-nofilepath} $* >> $ERROR; fi
      }
sayS() { if [ -n "${ERROR}" ];   then  echo `date` ${node:-nonode} ${command:-nocmd} ${pnfsid:-noid} ${filepath:-nofilepath} $* >> $SUCCESS; fi
      }

#
# returns file name for pnfs id
#
pathfinder() {
    id=$1
    fname=`head -n 1 "/pnfs/fs/.(nameof)($id)"`
    sum=$fname
    while : ; do
	id=`head -n 1 "/pnfs/fs/.(parent)($id)" 2>/dev/null`
	if [ $? -ne 0 ] ; then break ; fi
	fname=`head -n 1 "/pnfs/fs/.(nameof)($id)" 2>/dev/null`
	if [ $? -eq 0 ] ; then
	    sum=${fname}/$sum
	fi
    done
    echo $sum
}

#
# computes the wait on the basis of file size
#
fake_wait() {
    timeout=$((${si_size}/1000000))
    sleep $timeout
}

atrap1() { say real-encp trapped SIGHUP; }
atrap2() { say real-encp trapped SIGINT; }
atrap3() { say real-encp trapped SIGQUIT; exit 1; }
atrap9() { say real-encp trapped SIGKILL; exit 1; }

trap atrap1 1
trap atrap2 2
trap atrap3 3
trap atrap9 9

sP_bfid=0
sP_ls=0
P_nameof() { (cd $pnfs_root >/dev/null 2>&1;  cat ".(nameof)($1)" 2>/dev/null ); }
P_bfid()   { (cd $pnfs_root >/dev/null 2>&1;  cat ".(access)($1)(1)" ); sP_bfid=$?; }
P_size()   { (cd $pnfs_root >/dev/null 2>&1; stat ".(access)($1)" 2>/dev/null| grep Size: | awk '{print $2}' ); }
P_ls ()    { (cd $pnfs_root >/dev/null 2>&1;   ls ".(access)($1)" 2>/dev/null ); sP_ls=$?; }

node=`uname -n| sed -e 's/\([^\.]\)\..*/\1/'`

if [ $# -lt 3 ] ;then
    say Not enough arguments  $0 $args
    exit 4
else
    command=$1
    pnfsid=$2
    filepath=$3
    shift; shift; shift;
    say  $0 $*
fi

# parse the options passed in by the dcache
pnfs_root=""
while [ $# -gt 0 ] ;do
	if expr "$1" : "-pnfs=" >/dev/null 2>&1 ; then
	    pnfs_root=`echo $1 | sed -e "s/^-pnfs=//"`
	elif expr "$1" : "-command=" >/dev/null 2>&1 ; then
	    script_command=`echo $1 | sed -e "s/^-command=//"`
	elif expr "$1" : "-si=" >/dev/null 2>&1 ; then
	    #
	    # parse "-si" option
	    #
	    si=`echo $1 | sed -e 's/^-si=//'`
	    # split into list of key=value pairs
	    parts=`echo $si | tr ";" "\n"`
	    for p in $parts;
	    do
		F1=`echo $p | cut -d= -f1| sed -e 's/-/_/g'`
		F2=`echo $p | cut -d= -f2`
		if expr "${F1}" : "enstore://enstore" > /dev/null 2>&1 ; then
		    continue
		fi
		already="`eval echo \\$si_$F1 2>/dev/null`"
		if [ "$already" == "" -o "$already" == "<Unknown>" -o "$already" == "<unknown>" ]; then
		    eval si_$F1=\"$F2\"
		fi
	    done
	elif expr "$1" : "-uri="  >/dev/null 2>&1 ; then
	    #
	    # parse -uri option
	    #
	    uri=`echo $1 | sed -e 's/^-uri=//'`
	    parts=`echo $uri | tr "&" "\n"`
	    for p in $parts;
	      do
		if expr "${p}" : "enstore://enstore" > /dev/null 2>&1 ; then
		    continue
		fi
		eval uri_$p
	    done
	fi
	shift
done


# echo 'pnfs_root     = ' ${pnfs_root:-unset}
# echo 'script_command= ' ${script_command:-unset}


# si variables:

#echo 'si_size       = ' ${si_size:-unset}
#echo 'si_new        = ' ${si_new:-unset}
#echo 'si_stored     = ' ${si_stored:-unset}
#echo 'si_sClass     = ' ${si_sClass:-unset}
#echo 'si_cClass     = ' ${si_cClass:-unset}
#echo 'si_hsm        = ' ${si_hsm:-unset}
#echo 'si_accessLatency      = ' ${si_accessLatency:-unset}
#echo 'si_retentionPolicy      = ' ${si_retentionPolicy:-unset}
#echo 'si_StoreName  = ' ${si_StoreName:-unset}
#echo 'si_gid        = ' ${si_gid:-unset}
#echo 'si_uid        = ' ${si_uid:-unset}
echo 'si_path       = ' ${si_path:-unset}
#echo 'si_group      = ' ${si_group:-unset}
#echo 'si_family     = ' ${si_family:-unset}
#echo 'si_bfid       = ' ${si_bfid:-unset}
#echo 'si_volume     = ' ${si_volume:-unset}
#echo 'si_location   = ' ${si_location:-unset}
echo  'si_flag_c     = ' ${si_flag_c:-unset}
# uri variables

#echo 'uri_location_cookie = ' ${uri_location_cookie:-unset}
#echo 'uri_size            = ' ${uri_size:-unset}
#echo 'uri_file_family     = ' ${uri_file_family:-unset}
#echo 'uri_original_name   = ' ${uri_original_name:-unset}
#echo 'uri_map_file        = ' ${uri_map_file:-unset}
#echo 'uri_pnfsid_file     = ' ${uri_pnfsid_file:-unset}
#echo 'uri_bfid            = ' ${uri_bfid:-unset}
#echo 'uri_origdrive       = ' ${uri_origdrive:-unset}
#echo 'uri_crc             = ' ${uri_crc:-unset}

fsize=${si_size}

#remove double slashes:

si_path=`echo $si_path | sed -e "s/\/\/*/\//g"`
si_path=`pathfinder ${pnfsid}`

if [ -z "$pnfs_root" ] ;then
   say PNFS root not found in $0 $args
   exit 1
fi

# Return codes
# Return Code         Meaning                                Pool Behaviour
#                                                Into HSM                     From HSM
# 30 <= rc < 40       User defined               Deactivates request          Reports Problem to PoolManager
# 41                  No Space Left on device    Pool Retries                 Disables Pool,  Reports Problem to PoolManager
# 42                  Disk Read I/O Error        Pool Retries                 Disables Pool,  Reports Problem to PoolManager
# 43                  Disk Write I/O Error       Pool Retries                 Disables Pool,  Reports Problem to PoolManager
# All other                                      Pool Retries                 Reports Problem to PoolManager

#------------------------------------------------------------------------------------------
if [ "$command" = "get" ] ; then
    ##  fake wait here ...
    fake_wait
    dd bs=${si_size} count=1 if=/dev/zero of=${filepath}
    ENCP_EXIT=$?
    say encp --get-cache $pnfsid $filepath, rc=$ENCP_EXIT
   if [ $ENCP_EXIT -eq 0 ]; then 
       rm -f $out
      sayS g2s get, rc=$ENCP_EXIT
   else
       sayE g2e get, rc=$ENCP_EXIT
   fi
   exit $ENCP_EXIT
#------------------------------------------------------------------------------------------
elif [ "$command" = "put" ] ; then
    crc=`echo ${si_flag_c} | cut -d ":" -f2`
    crc=`printf "%d" 0x${crc}`
    # generate bid
    bfid=$(dbus-uuidgen)
    fn=`basename ${si_path}`
    dn=`dirname  ${si_path}`
    d=`date +"%s"`
    say "PATH NAME $dn/.(use)(1)($fn)"
    echo $bfid > $dn/".(use)(1)($fn)"
    ##  fake wait here ...
    fake_wait
    cat > $dn/".(use)(4)($fn)" <<EOF
VOL001
0000_000000000_0000001
${si_size}
${si_group}
${si_path}

${pnfsid}

${bfid}
localhost:/dev/tmp/tps0d0n:${d}
${crc}
EOF
    rm -f ${out}
    ENCP_EXIT=$?
    
    exit $ENCP_EXIT
fi
#------------------------------------------------------------------------------------------

say  ERROR $0 $args HOW DID WE GET HERE
exit 99
