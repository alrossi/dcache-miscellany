#!/bin/bash

TEST=
CREDS=$1
INDEX=
EXIT_ON_FAIL=0

check_succeeded() {
    if [ "$?" != "0" ] ; then
        echo "$INDEX : $TEST FAILED, SHOULD HAVE SUCCEEDED"
        if [ "$EXIT_ON_FAIL" == 1 ] ; then
            exit 1
        fi
    fi
}

check_failed() {
    if [ "$?" == "0" ] ; then
        echo "$INDEX : $TEST SUCCEEDED, SHOULD HAVE FAILED"
        if [ "$EXIT_ON_FAIL" == 1 ] ; then
            exit 1
        fi
    fi
}

run_2p_anon() {
    rm -f /tmp/x509up_u8773
    rm -f $XDG_RUNTIME_DIR/bt_u8773

    case $INDEX in
        0)
            TEST="xroot://  2p read world-readable file NO AUTH"
            echo "$INDEX  ($TEST)"
            xrdcp5x -f xroot://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/world-readable /dev/null
            check_succeeded 
        ;;
        1)
            TEST="xroot://  2p read non-world-readable file NO AUTH"
            echo "$INDEX  ($TEST)"
            xrdcp5x -f xroot://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected-file /dev/null
            check_failed            
        ;;
        2)
            TEST="xroot://  2p write to protected area NO AUTH"
            echo "$INDEX  ($TEST)"
            xrdcp5x data/data_1b xroot://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected/data-`date +%Y%m%d%H%M%s%N`
            check_failed
        ;;
        3)
            TEST="xroots://  2p read world-readable file NO AUTH"
            echo "$INDEX  ($TEST)"
            xrdcp5x -f xroots://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/world-readable /dev/null
            check_succeeded 
        ;;
        4)
            TEST="xroots://  2p read non-world-readable file NO AUTH"
            echo "$INDEX  ($TEST)"
            xrdcp5x -f xroots://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected-file /dev/null
            check_failed
        ;;
        5)
            TEST="xroots://  2p write to protected area NO AUTH"
            echo "$INDEX  ($TEST)"
            xrdcp5x data/data_1b xroots://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected/data-`date +%Y%m%d%H%M%s%N`
            check_failed
        ;;
        *)
        ;;
    esac
}

run_2p_GSI() {
    cp $CREDS/x509up_u8773 /tmp
    rm -f $XDG_RUNTIME_DIR/bt_u8773

    case $INDEX in
        6)
            TEST="xroot://  2p read world-readable file GSI"
            echo "$INDEX  ($TEST)"
            xrdcp5x -f xroot://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/world-readable /dev/null
            check_succeeded 
        ;;
        7)
            TEST="xroot://  2p read non-world-readable file GSI"
            echo "$INDEX  ($TEST)"
            xrdcp5x -f xroot://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected-file /dev/null
            check_succeeded
        ;;
        8)
            TEST="xroot://  2p write to protected area GSI"
            echo "$INDEX  ($TEST)"
            xrdcp5x data/data_1b xroot://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected/data-`date +%Y%m%d%H%M%s%N`
            check_succeeded 
        ;;
        9)
            TEST="xroots://  2p read world-readable file GSI"
            echo "$INDEX  ($TEST)"
            xrdcp5x -f xroots://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/world-readable /dev/null
            check_succeeded 
        ;;
        10)
            TEST="xroots://  2p read non-world-readable file GSI" 
            echo "$INDEX  ($TEST)"
            xrdcp5x -f xroots://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected-file /dev/null
            check_succeeded 
        ;;
        11)
            TEST="xroots://  2p write to protected area GSI"
            echo "$INDEX  ($TEST)"
            xrdcp5x data/data_1b xroots://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected/data-`date +%Y%m%d%H%M%s%N`
            check_succeeded
        ;;
        *)
        ;;
    esac
}

run_2p_CGI() {
    rm -f /tmp/x509up_u8773
    rm -f $XDG_RUNTIME_DIR/bt_u8773

    case $INDEX in
        12)
            TEST="xroot://  2p read world-readable file JWT/CGI"
            echo "$INDEX  ($TEST)"
            xrdcp5x -f xroot://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/world-readable?authz=Bearer%20`cat $CREDS/bt_u8773` /dev/null
            check_failed
        ;;
        13)
            TEST="xroot://  2p read non-world-readable file JWT/CGI"
            echo "$INDEX  ($TEST)"
            xrdcp5x -f xroot://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected-file?authz=Bearer%20`cat $CREDS/bt_u8773` /dev/null
            check_failed
        ;;
        14)
            TEST="xroot://  2p write to protected area JWT/CGI"
            echo "$INDEX  ($TEST)"
            xrdcp5x data/data_1b xroot://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected/data-`date +%Y%m%d%H%M%s%N`?authz=Bearer%20`cat $CREDS/bt_u8773`
            check_failed
        ;;
        15)
            TEST="xroots://  2p read world-readable file JWT/CGI"
            echo "$INDEX  ($TEST)"
            xrdcp5x -f xroots://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/world-readable?authz=Bearer%20`cat $CREDS/bt_u8773` /dev/null
            check_succeeded
        ;;
        16)
            TEST="xroots://  2p read non-world-readable file JWT/CGI"
            echo "$INDEX  ($TEST)"
            xrdcp5x -f xroots://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected-file?authz=Bearer%20`cat $CREDS/bt_u8773` /dev/null
            check_succeeded 
        ;;
        17)
            TEST="xroots://  2p write to protected area JWT/CGI"
            echo "$INDEX  ($TEST)"
            xrdcp5x data/data_1b xroots://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected/data-`date +%Y%m%d%H%M%s%N`?authz=Bearer%20`cat $CREDS/bt_u8773`
            check_succeeded
        ;;
        *)
        ;;
    esac
}

run_2p_ZTN() {
    rm -f /tmp/x509up_u8773
    cp $CREDS/bt_u8773  $XDG_RUNTIME_DIR

    case $INDEX in
        18)
            TEST="xroot://  2p read world-readable file ZTN"
            echo "$INDEX  ($TEST)"
            xrdcp5x -f xroot://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/world-readable /dev/null
            check_succeeded     
        ;;
        19)
            TEST="xroot://  2p read non-world-readable file ZTN"
            echo "$INDEX  ($TEST)"
            xrdcp5x -f xroot://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected-file /dev/null
            check_failed
        ;;
        20)
            TEST="xroot://  2p write to protected area ZTN"
            echo "$INDEX  ($TEST)"
            xrdcp5x data/data_1b xroot://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected/data-`date +%Y%m%d%H%M%s%N`
            check_failed
        ;;
        21)
            TEST="xroots://  2p read world-readable file ZTN"
            echo "$INDEX  ($TEST)"
            xrdcp5x -f xroots://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/world-readable /dev/null
            check_succeeded 
        ;;
        22)
            TEST="xroots://  2p read non-world-readable file ZTN"
            echo "$INDEX  ($TEST)"
            xrdcp5x -f xroots://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected-file /dev/null
            check_succeeded
        ;;
        23)
            TEST="xroots://  2p write to protected area ZTN"
            echo "$INDEX  ($TEST)"
            xrdcp5x data/data_1b xroots://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected/data-`date +%Y%m%d%H%M%s%N`
            check_succeeded
        ;;
        *)
        ;;
    esac
}

run_2p_ZTN_CGI() {
    rm -f /tmp/x509up_u8773
    cp $CREDS/bt_u8773  $XDG_RUNTIME_DIR

    case $INDEX in
        24)
            TEST="xroot://  2p read world-readable file ZTN+JWT/CGI"
            echo "$INDEX  ($TEST)"
            xrdcp5x -f xroot://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/world-readable?authz=Bearer%20`cat $CREDS/bt_u8773` /dev/null
            check_failed
        ;;
        25)
            TEST="xroot://  2p read non-world-readable file ZTN+JWT/CGI"
            echo "$INDEX  ($TEST)"
            xrdcp5x -f xroot://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected-file?authz=Bearer%20`cat $CREDS/bt_u8773` /dev/null
            check_failed
        ;;
        26)
            TEST="xroot://  2p write to protected area ZTN+JWT/CGI"
            echo "$INDEX  ($TEST)"
            xrdcp5x data/data_1b xroot://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected/data-`date +%Y%m%d%H%M%s%N`?authz=Bearer%20`cat $CREDS/bt_u8773`
            check_failed
        ;;
        27)
            TEST="xroots://  2p read world-readable file ZTN+JWT/CGI"
            echo "$INDEX  ($TEST)"
            xrdcp5x -f xroots://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/world-readable?authz=Bearer%20`cat $CREDS/bt_u8773` /dev/null
            check_succeeded
        ;;
        28)
            TEST="xroots://  2p read non-world-readable file ZTN+JWT/CGI"
            echo "$INDEX  ($TEST)"
            xrdcp5x -f xroots://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected-file?authz=Bearer%20`cat $CREDS/bt_u8773` /dev/null
            check_succeeded
        ;;
        29)
            TEST="xroots://  2p write to protected area ZTN+JWT/CGI"
            echo "$INDEX  ($TEST)"
            xrdcp5x data/data_1b xroots://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected/data-`date +%Y%m%d%H%M%s%N`?authz=Bearer%20`cat $CREDS/bt_u8773`
            check_succeeded
        ;;
        *)
        ;;
    esac
}

run_2p_GSI_ZTN() {
    cp $CREDS/x509up_u8773 /tmp
    cp $CREDS/bt_u8773  $XDG_RUNTIME_DIR
    
    case $INDEX in
        30)
            TEST="xroot://  2p write to protected area GSI+ZTN"
            echo "$INDEX  ($TEST)"
            xrdcp5x data/data_1b xroot://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected/data-`date +%Y%m%d%H%M%s%N`
            check_succeeded 
        ;;
        31)
            TEST="xroot://  2p write to protected area GSI+ZTN+JWT/CGI"
            echo "$INDEX  ($TEST)"
            xrdcp5x -f xroot://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected-file?authz=Bearer%20`cat $CREDS/bt_u8773` /dev/null
            check_failed
        ;;
        32)
            TEST="xroots://  2p write to protected area GSI+ZTN+JWT/CGI"
            echo "$INDEX  ($TEST)"
            xrdcp5x -f xroots://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected-file?authz=Bearer%20`cat $CREDS/bt_u8773` /dev/null
            check_succeeded
        ;;
        33)
            TEST="xroot://  2p write to root-owned area GSI+ZTN"
            echo "$INDEX  ($TEST)"
            xrdcp5x data/data_1b xroot://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/root-owned/data-`date +%Y%m%d%H%M%s%N`
            check_failed
        ;;
        34)
            TEST="xroots://  2p write to root-owned area GSI+ZTN+JWT/CGI"
            echo "$INDEX  ($TEST)"
            xrdcp5x data/data_1b xroots://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/root-owned/data-`date +%Y%m%d%H%M%s%N`?authz=Bearer%20`cat $CREDS/bt_u8773`
            check_succeeded
        ;;
         *)
        ;;
    esac
}

run_tpc_GSI() {
    cp $CREDS/x509up_u8773 /tmp
    rm -f $XDG_RUNTIME_DIR/bt_u8773

    case $INDEX in
        35)
            TEST="dCache : dCache –– xroot://  TPC x509 delegated proxy"
            echo "$INDEX  ($TEST)"
            xrdcp5x --tpc delegate only xroot://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected-file xroot://fndcatemp2.fnal.gov:1095//pnfs/fs/usr/fermilab/users/arossi/volatile/protected/data-`date +%Y%m%d%H%M%s%N`
            check_succeeded     
        ;;
        36)
            TEST="dCache : dCache –– xroots://  TPC x509 delegated proxy"
            echo "$INDEX  ($TEST)"
            xrdcp5x --tpc delegate only xroots://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected-file xroots://fndcatemp2.fnal.gov:1095//pnfs/fs/usr/fermilab/users/arossi/volatile/protected/data-`date +%Y%m%d%H%M%s%N`
            check_succeeded
        ;;
        37)
            TEST="dCache : xrootd –– xroot://  TPC x509 delegated proxy"
            echo "$INDEX  ($TEST)"
            xrdcp5x --tpc delegate only xroot://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected-file xroot://fndcatemp1.fnal.gov:1095//fermilab/users/arossi/data-`date +%Y%m%d%H%M%s%N`
            check_succeeded
        ;;
        38)
            TEST="xrootd : dCache –– xroot://  TPC x509 delegated proxy"
            echo "$INDEX  ($TEST)"
            xrdcp5x --tpc delegate only xroot://fndcatemp1.fnal.gov:1095//fermilab/users/arossi/data_1b xroots://fndcatemp2.fnal.gov:1095//pnfs/fs/usr/fermilab/users/arossi/volatile/protected/data-`date +%Y%m%d%H%M%s%N`
            check_succeeded
        ;;
        *)
        ;;
    esac
}

run_tpc_CGI() {
    rm -f /tmp/x509up_u8773
    rm -f $XDG_RUNTIME_DIR/bt_u8773

    case $INDEX in
        39)
            TEST="dCache : dCache –– xroot:// world-readable src, NO AUTH; xroots:// dst write to protected area JWT/CGI"
            echo "$INDEX  ($TEST)"
            xrdcp5x --tpc only xroot://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/world-readable xroots://fndcatemp2.fnal.gov:1095//pnfs/fs/usr/fermilab/users/arossi/volatile/protected/data-`date +%Y%m%d%H%M%s%N`?authz=Bearer%20`cat $CREDS/bt_u8773`
            check_succeeded
        ;;
        40)
            TEST="dCache : dCache –– xroot:// non-world-readable src, NO AUTH; xroots:// dst write to protected area JWT/CGI"
            echo "$INDEX  ($TEST)"
            xrdcp5x --tpc only xroot://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected-file xroots://fndcatemp2.fnal.gov:1095//pnfs/fs/usr/fermilab/users/arossi/volatile/protected/data-`date +%Y%m%d%H%M%s%N`?authz=Bearer%20`cat $CREDS/bt_u8773`
            check_failed
        ;;
        41)
            TEST="dCache : dCache –– xroot:// non-world-readable src, NO AUTH; xroots:// dst write to protected area JWT/CGI"
            echo "$INDEX  ($TEST)"
            xrdcp5x --tpc only xroot://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected-file xroots://fndcatemp2.fnal.gov:1095//pnfs/fs/usr/fermilab/users/arossi/volatile/protected/data-`date +%Y%m%d%H%M%s%N`?authz=Bearer%20`cat $CREDS/bt_u8773`
            check_failed
        ;;
        42)
            TEST="dCache : dCache –– xroots:// non-world-readable src, JWT/CGI; xroots:// dst write to protected area JWT/CGI"
            echo "$INDEX  ($TEST)"
            xrdcp5x --tpc only xroots://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected-file?authz=Bearer%20`cat $CREDS/bt_u8773` xroots://fndcatemp2.fnal.gov:1095//pnfs/fs/usr/fermilab/users/arossi/volatile/protected/data-`date +%Y%m%d%H%M%s%N`?authz=Bearer%20`cat $CREDS/bt_u8773`
            check_succeeded
        ;;
        43)
            TEST="dCache : xrootd –– xroot:// world-readable src, NO AUTH; xroots:// dst write to protected area JWT/CGI"
            echo "$INDEX  ($TEST)"
            xrdcp5x --tpc only xroot://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/world-readable xroots://fndcatemp1.fnal.gov:1094//fermilab/users/arossi/data-`date +%Y%m%d%H%M%s%N`?authz=Bearer%20`cat $CREDS/bt_u8773`
            check_succeeded
        ;;
        44)
            TEST="dCache : xrootd –– xroots:// non-world-readable src, JWT/CGI; xroots:// dst write to protected area JWT/CGI"
            echo "$INDEX  ($TEST)"
            xrdcp5x --tpc only xroots://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected-file?authz=Bearer%20`cat $CREDS/bt_u8773` xroots://fndcatemp1.fnal.gov:1094//fermilab/users/arossi/data-`date +%Y%m%d%H%M%s%N`?authz=Bearer%20`cat $CREDS/bt_u8773`
            check_succeeded
        ;;
        45)
            TEST="xrootd : dCache –– xroots:// non-world-readable src, JWT/CGI; xroots:// dst write to protected area JWT/CGI"
            echo "$INDEX  ($TEST)"
            xrdcp5x --tpc only xroots://fndcatemp1.fnal.gov:1094//fermilab/users/arossi/data_1b?authz=Bearer%20`cat $CREDS/bt_u8773` xroots://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected/data-`date +%Y%m%d%H%M%s%N`?authz=Bearer%20`cat $CREDS/bt_u8773`
            check_succeeded
        ;;
        *)
        ;;
    esac
}

run_tpc_ZTN() {
    rm -f /tmp/x509up_u8773
    cp $CREDS/bt_u8773  $XDG_RUNTIME_DIR
    
    case $INDEX in
        46)
            TEST="dCache : dCache –– xroot:// world-readable src, NO AUTH; xroots:// dst write to protected area ZTN"
            echo "$INDEX  ($TEST)"
            xrdcp5x --tpc only xroot://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/world-readable xroots://fndcatemp2.fnal.gov:1095//pnfs/fs/usr/fermilab/users/arossi/volatile/protected/data-`date +%Y%m%d%H%M%s%N`
            check_succeeded 
        ;;
        47)
            TEST="dCache : dCache –– xroots:// non-world-readable src, ZTN; xroots:// dst write to protected area ZTN"
            echo "$INDEX  ($TEST)"
            xrdcp5x --tpc only xroots://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected-file xroots://fndcatemp2.fnal.gov:1095//pnfs/fs/usr/fermilab/users/arossi/volatile/protected/data-`date +%Y%m%d%H%M%s%N`
            check_succeeded
        ;;
        48)
            TEST="dCache : xrootd –– xroot:// world-readable src, NO AUTH; xroots:// dst write to protected area ZTN [should succeed with future release of scitoken library]"
            echo "$INDEX  ($TEST)"
            xrdcp5x --tpc only xroot://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/world-readable xroots://fndcatemp1.fnal.gov:1096//fermilab/users/arossi/data-`date +%Y%m%d%H%M%s%N`
            check_failed
        ;;
        49)
            TEST="dCache : xrootd –– xroots:// non-world-readable src, ZTN; xroots:// dst write to protected area ZTN [should succeed with future release of scitoken library]"
            echo "$INDEX  ($TEST)"
            xrdcp5x --tpc only xroots://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected-file xroots://fndcatemp1.fnal.gov:1096//fermilab/users/arossi/data-`date +%Y%m%d%H%M%s%N`
            check_failed
        ;;
        50)
            TEST="dCache : xrootd –– xroots:// non-world-readable src, ZTN; xroots:// dst write to protected area ZTN+JWT/CGI [works because of 'none/unix' protocol at end of dCache chain]"
            echo "$INDEX  ($TEST)"
            xrdcp5x --tpc only xroots://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected-file xroots://fndcatemp1.fnal.gov:1096//fermilab/users/arossi/data-`date +%Y%m%d%H%M%s%N`?authz=Bearer%20`cat $CREDS/bt_u8773`
            check_succeeded
        ;;
        51)
            TEST="xrootd : dCache –– xroots:// non-world-readable src, ZTN; xroots:// dst write to protected area ZTN [should work after scitoken changes, if server also uses unix]"
            echo "$INDEX  ($TEST)"
            xrdcp5x --tpc only xroots://fndcatemp1.fnal.gov:1096//fermilab/users/arossi/data_1b xroots://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected/data-`date +%Y%m%d%H%M%s%N`
            check_failed
        ;;
        52)
            TEST="xrootd : dCache –– xroots:// non-world-readable src, ZTN+JWT/CGI; xroots:// dst write to protected area ZTN [should work if server also uses unix]"
            echo "$INDEX  ($TEST)"
            xrdcp5x --tpc only xroots://fndcatemp1.fnal.gov:1096//fermilab/users/arossi/data_1b?authz=Bearer%20`cat $CREDS/bt_u8773` xroots://fndcatemp2.fnal.gov:1094//pnfs/fs/usr/fermilab/users/arossi/volatile/protected/data-`date +%Y%m%d%H%M%s%N`
            check_failed
        ;;
        *)
        ;;
    esac
}

if [ -z "$2" ] ; then
    START=0
else 
    START="$2"
fi

if [ -z "$3" ] ; then
    END=52
else 
    END="$3"
fi

echo "RUNNING TESTS $START THROUGH $END"
echo ""

for j in `seq "$START" "$END"`
do  
    INDEX=$j

    if [ "$INDEX" -lt 6 ] ; then
        run_2p_anon
    elif [ "$INDEX" -lt 12 ] ; then
        run_2p_GSI
    elif [ "$INDEX" -lt 18 ] ; then  
        run_2p_CGI
    elif [ "$INDEX" -lt 24 ] ; then  
        run_2p_ZTN
    elif [ "$INDEX" -lt 30 ] ; then  
        run_2p_ZTN_CGI
    elif [ "$INDEX" -lt 35 ] ; then  
        run_2p_GSI_ZTN
    elif [ "$INDEX" -lt 39 ] ; then  
        run_tpc_GSI
    elif [ "$INDEX" -lt 46 ] ; then  
        run_tpc_CGI
    else
        run_tpc_ZTN 
    fi  
done