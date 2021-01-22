#!/bin/bash

#
# QoS Engine
#

mkdir -p modules/dcache-qos/src/main/java/org/dcache/qos/local/clients
mkdir -p modules/dcache-qos/src/main/java/org/dcache/qos/remote/receivers
mkdir -p modules/dcache-qos/src/main/java/org/dcache/qos/services/engine/admin
mkdir -p modules/dcache-qos/src/main/java/org/dcache/qos/services/engine/handler
mkdir -p modules/dcache-qos/src/main/java/org/dcache/qos/services/engine/provider
mkdir -p modules/dcache-qos/src/main/java/org/dcache/qos/services/engine/util

cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/local/clients/LocalQoSRequirementsClient.java modules/dcache-qos/src/main/java/org/dcache/qos/local/clients
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/remote/receivers/QoSRequirementsReceiver.java modules/dcache-qos/src/main/java/org/dcache/qos/remote/receivers
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/engine/admin/QoSEngineAdmin.java modules/dcache-qos/src/main/java/org/dcache/qos/services/engine/admin
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/engine/handler/FileQoSStatusHandler.java modules/dcache-qos/src/main/java/org/dcache/qos/services/engine/handler
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/engine/provider/ALRPStorageUnitQoSProvider.java modules/dcache-qos/src/main/java/org/dcache/qos/services/engine/provider
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/engine/provider/QoSRequirementsProvider.java modules/dcache-qos/src/main/java/org/dcache/qos/services/engine/provider
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/engine/util/QoSEngineCounters.java modules/dcache-qos/src/main/java/org/dcache/qos/services/engine/util

