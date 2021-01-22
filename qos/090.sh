#!/bin/bash

#
# (9) QoS Adjuster 0 Utils
#

mkdir -p  modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/util

cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/util/QoSAdjusterCounters.java modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/util
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/util/StaticSinglePoolList.java modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/util
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/util/DegenerateSelectionStrategy.java modules/dcache-qos/src/main/java/org/dcache/qos/services/adjuster/util

