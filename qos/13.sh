#!/bin/bash

#
# (13) QoS Spring
#

mkdir -p  modules/dcache-qos/src/main/resources/org/dcache/qos
cp /Work/fnal/dCache/qos/modules/dcache/src/main/resources/org/dcache/pool/classic/pool.xml modules/dcache/src/main/resources/org/dcache/pool/classic
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/resources/org/dcache/qos-adjuster.xml modules/dcache-qos/src/main/resources/org/dcache/qos
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/resources/org/dcache/qos-engine.xml modules/dcache-qos/src/main/resources/org/dcache/qos
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/resources/org/dcache/qos-scanner.xml modules/dcache-qos/src/main/resources/org/dcache/qos
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/resources/org/dcache/qos-verifier.xml modules/dcache-qos/src/main/resources/org/dcache/qos
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/resources/org/dcache/qos.xml modules/dcache-qos/src/main/resources/org/dcache/qos
