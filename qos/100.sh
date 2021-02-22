#!/bin/bash

#
# (10) QoS Scanner 0 Misc
#

mkdir -p  modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/data
mkdir -p  modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/handlers
mkdir -p  modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/util

cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/data/PoolFilter.java  modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/data
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/data/PoolMatcher.java modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/data
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/handlers/PoolOpDiff.java modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/handlers
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/util/QoSScannerCounters.java modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/util
