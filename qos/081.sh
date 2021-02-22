#!/bin/bash

#
# (8) QoS Engine 1:  Util & Handler
#

mkdir -p modules/dcache-qos/src/main/java/org/dcache/qos/services/engine/handler
mkdir -p modules/dcache-qos/src/main/java/org/dcache/qos/services/engine/util
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/services/engine/handler/FileQoSStatusHandler.java modules/dcache-qos/src/main/java/org/dcache/qos/services/engine/handler
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/services/engine/util/QoSEngineCounters.java modules/dcache-qos/src/main/java/org/dcache/qos/services/engine/util
