#!/bin/bash

#
# (10) QoS Scanner 1 Namespace
#

mkdir -p  modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/namespace

cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/data/PoolScanSummary.java modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/data
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/namespace/LocalNamespaceAccess.java modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/namespace
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/namespace/NamespaceAccess.java modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/namespace
