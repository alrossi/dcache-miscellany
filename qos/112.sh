#!/bin/bash

#
# (11) QoS Verifier 2 Core
#

mkdir -p  modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/handlers

cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/data/FileQoSOperationMap.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/data
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/data/PoolInfoMap.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/data
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/handlers/CheckpointHandler.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/handlers
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/handlers/FileQoSOperationHandler.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/handlers
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/handlers/PoolInfoChangeHandler.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/handlers
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/util/QoSVerificationTask.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/util
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/util/VerifierMapInitializer.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/util
