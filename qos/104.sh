#!/bin/bash

#
# dcache-qos (10.4): QoS Scanner admin, client, receiver
#

mkdir -p  modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/admin

cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/admin/QoSScannerAdmin.java modules/dcache-qos/src/main/java/org/dcache/qos/services/scanner/admin
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/local/clients/LocalQoSScannerClient.java modules/dcache-qos/src/main/java/org/dcache/qos/local/clients
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/remote/receivers/QoSScannerReceiver.java modules/dcache-qos/src/main/java/org/dcache/qos/remote/receivers
