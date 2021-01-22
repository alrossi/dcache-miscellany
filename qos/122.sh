#!/bin/bash

#
# (12) QoS Junit Tests 2 (scanner)
#

mkdir -p  modules/dcache-qos/src/test/java/org/dcache/qos/services/scanner/data
mkdir -p  modules/dcache-qos/src/test/java/org/dcache/qos/services/scanner/handlers

cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/test/java/org/dcache/qos/services/scanner/data/PoolFilterTest.java modules/dcache-qos/src/test/java/org/dcache/qos/services/scanner/data
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/test/java/org/dcache/qos/services/scanner/data/PoolOpChangeHandlerTest.java modules/dcache-qos/src/test/java/org/dcache/qos/services/scanner/data
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/test/java/org/dcache/qos/services/scanner/data/PoolOperationMapTest.java modules/dcache-qos/src/test/java/org/dcache/qos/services/scanner/data
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/test/java/org/dcache/qos/services/scanner/data/PoolStatusTransitionTest.java modules/dcache-qos/src/test/java/org/dcache/qos/services/scanner/data
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/test/java/org/dcache/qos/services/scanner/handlers/PoolOperationHandlerTest.java modules/dcache-qos/src/test/java/org/dcache/qos/services/scanner/handlers
