#!/bin/bash

#
# (9) QoS Adjuster
#

mkdir -p  modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/adjusters
mkdir -p  modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/admin
mkdir -p  modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/data
mkdir -p  modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/handlers
mkdir -p  modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/util
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/local/clients/LocalQoSAdjustmentClient.java modules/dcache-qos/src/main/java/org/dcache/qos/local/clients
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/remote/receivers/QoSAdjustmentReceiver.java modules/dcache-qos/src/main/java/org/dcache/qos/remote/receivers
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/adjusters/CopyAdjuster.java modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/adjusters
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/adjusters/FlushAdjuster.java modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/adjusters
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/adjusters/QoSAdjuster.java modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/adjusters
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/adjusters/QoSAdjusterFactory.java modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/adjusters
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/adjusters/ReplicaStateAdjuster.java modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/adjusters
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/adjusters/StagingAdjuster.java modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/adjusters
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/admin/QoSAdjusterAdmin.java modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/admin
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/data/QoSAdjusterTaskMap.java modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/data
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/handlers/QoSAdjustTaskCompletionHandler.java modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/handlers
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/handlers/QoSAdjusterTaskHandler.java modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/handlers
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/util/QoSAdjusterCounters.java modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/util
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/util/QoSAdjusterTask.java modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/util
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/util/StaticSinglePoolList.java modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/util
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/util/DegenerateSelectionStrategy.java modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/util

