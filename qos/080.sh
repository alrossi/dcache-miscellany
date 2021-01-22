#!/bin/bash

#
# (8) QoS Engine 0:  Provider
#

mkdir -p modules/dcache-qos/src/main/java/org/dcache/qos/services/engine/provider
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/services/engine/provider/ALRPStorageUnitQoSProvider.java modules/dcache-qos/src/main/java/org/dcache/qos/services/engine/provider
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/services/engine/provider/QoSRequirementsProvider.java modules/dcache-qos/src/main/java/org/dcache/qos/services/engine/provider
