#!/bin/bash

#
# (8) QoS Engine 2:  Client & Receiver
#

mkdir -p modules/dcache-qos/src/main/java/org/dcache/qos/local/clients
mkdir -p modules/dcache-qos/src/main/java/org/dcache/qos/remote/receivers
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/local/clients/LocalQoSRequirementsClient.java modules/dcache-qos/src/main/java/org/dcache/qos/local/clients
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/remote/receivers/QoSRequirementsReceiver.java modules/dcache-qos/src/main/java/org/dcache/qos/remote/receivers