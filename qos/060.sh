#!/bin/bash

#
# (6)  QoS Listeners and Remote Clients
#

mkdir -p modules/dcache-qos/src/main/java/org/dcache/qos/listeners
mkdir -p modules/dcache-qos/src/main/java/org/dcache/qos/remote/clients
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/data/PoolQoSStatus.java modules/dcache-qos/src/main/java/org/dcache/qos/data
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/listeners/QoSActionCompletedListener.java modules/dcache-qos/src/main/java/org/dcache/qos/listeners
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/listeners/QoSAdjustmentListener.java modules/dcache-qos/src/main/java/org/dcache/qos/listeners
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/listeners/QoSPoolScanResponseListener.java modules/dcache-qos/src/main/java/org/dcache/qos/listeners
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/listeners/QoSVerificationListener.java modules/dcache-qos/src/main/java/org/dcache/qos/listeners
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/remote/clients/RemoteQoSActionCompletedClient.java modules/dcache-qos/src/main/java/org/dcache/qos/remote/clients
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/remote/clients/RemoteQoSAdjustmentClient.java modules/dcache-qos/src/main/java/org/dcache/qos/remote/clients
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/remote/clients/RemoteQoSScannerClient.java modules/dcache-qos/src/main/java/org/dcache/qos/remote/clients
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/remote/clients/RemoteQoSVerificationClient.java modules/dcache-qos/src/main/java/org/dcache/qos/remote/clients
