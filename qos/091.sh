#!/bin/bash

#
# (9) QoS Adjuster 1 Core
#

mkdir -p  modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/adjusters
mkdir -p  modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/data
mkdir -p  modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/handlers

cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/adjusters/CopyAdjuster.java modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/adjusters
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/adjusters/FlushAdjuster.java modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/adjusters
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/adjusters/QoSAdjuster.java modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/adjusters
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/adjusters/QoSAdjusterFactory.java modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/adjusters
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/adjusters/ReplicaStateAdjuster.java modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/adjusters
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/adjusters/StagingAdjuster.java modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/adjusters
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/data/QoSAdjusterTaskMap.java modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/data
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/handlers/QoSAdjustTaskCompletionHandler.java modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/handlers
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/handlers/QoSAdjusterTaskHandler.java modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/handlers
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/util/QoSAdjusterTask.java modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/util