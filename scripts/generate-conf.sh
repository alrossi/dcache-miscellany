#!/bin/sh

DIR=`pwd`
TARGET=${DIR}/dcache.conf

rm -f ${TARGET}

cd $DCACHE_GIT/skel/share/defaults

PROPFILES=`find . -name "*.properties" | sort`

for FILE in ${PROPFILES}
do
    NAME=`echo ${FILE} | cut -c 3-`
    
    echo "#######################################" >> ${TARGET}
    echo ${NAME} >> ${TARGET}
    echo "#######################################" >> ${TARGET}
    
    while IFS=$'\t' read LINE
    do
        LINE=`echo ${LINE} | tr -d " " | grep -v '#' | grep -v @ | grep -v immutable | grep -v deprecated | grep -v obsolete | grep -v forbidden | grep -v 'not-for-services'`
        if [ -z ${LINE} ]; then
            continue
        fi
        
        CHOICE=`echo ${LINE} | grep -e "of[?]"`
        
        if [ ! -z ${CHOICE} ]; then
            i=`expr index ${LINE} "\)"`
            ((++i))
            LINE=`echo ${LINE} | cut -c ${i}-`
        fi
        
        echo "#${LINE}" >> ${TARGET}
    done < ${FILE}
    echo '' >> ${TARGET}
done

cd ${DIR}
#cat ${TARGET}
