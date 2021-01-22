#!/bin/bash

#
# QoS Scanner
#

mkdir -p  modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/admin
mkdir -p  modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/data
mkdir -p  modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/handlers
mkdir -p  modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/namespace
mkdir -p  modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/util
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/local/clients/LocalQoSScannerClient.java modules/dcache-qos/src/main/java/org/dcache/qos/local/clients
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/remote/receivers/QoSScannerReceiver.java modules/dcache-qos/src/main/java/org/dcache/qos/remote/receivers
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/admin/QoSScannerAdmin.java modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/admin
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/data/PoolFilter.java  modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/data
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/data/PoolMatcher.java modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/data
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/data/PoolOperation.java modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/data
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/data/PoolOperationMap.java modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/data
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/data/PoolScanSummary.java modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/data
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/handlers/PoolOpChangeHandler.java modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/handlers
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/handlers/PoolOpDiff.java modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/handlers
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/handlers/PoolOperationHandler.java modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/handlers
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/handlers/PoolTaskCompletionHandler.java modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/handlers
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/namespace/LocalNamespaceAccess.java modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/namespace
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/namespace/NamespaceAccess.java modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/namespace
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/util/PoolScanTask.java modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/util
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/util/QoSScannerCounters.java modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/util
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/util/ScannerMapInitializer.java modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/util
