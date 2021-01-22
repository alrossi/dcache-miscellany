#!/bin/bash

#
# (11) QoS Verifier
#

mkdir -p  modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/admin
mkdir -p  modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/data
mkdir -p  modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/handlers
mkdir -p  modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/util

cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/local/clients/LocalQoSVerificationClient.java modules/dcache-qos/src/main/java/org/dcache/qos/local/clients
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/remote/receivers/QoSVerificationReceiver.java modules/dcache-qos/src/main/java/org/dcache/qos/remote/receivers
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/admin/QoSVerifierAdmin.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/admin
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/data/FileQoSCancelFilter.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/data
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/data/FileQoSFilter.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/data
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/data/FileQoSLocations.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/data
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/data/FileQoSMatcher.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/data
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/data/FileQoSOpCheckpointRecord.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/data
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/data/FileQoSOperation.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/data
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/data/FileQoSOperationMap.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/data
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/data/PoolInfoDiff.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/data
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/data/PoolInfoFilter.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/data
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/data/PoolInfoMap.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/data
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/data/PoolInformation.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/data
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/data/PrimaryGroupMarker.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/data
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/data/QoSOperation.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/data
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/data/StorageUnitConstraints.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/data
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/handlers/CheckpointHandler.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/handlers
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/handlers/FileQoSOperationHandler.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/handlers
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/handlers/FileQoSStatusVerifier.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/handlers
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/handlers/PoolGroupAndTagsQoSVerifier.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/handlers
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/handlers/PoolInfoChangeHandler.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/handlers
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/util/AbstractLocationExtractor.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/util
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/util/ConstraintDiscriminator.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/util
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/util/EvictingLocationExtractor.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/util
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/util/LocationSelectionException.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/util
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/util/LocationSelector.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/util
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/util/PoolInfoLocationSelector.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/util
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/util/PoolTagBasedLocationExtractor.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/util
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/util/QoSVerificationTask.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/util
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/util/QoSVerifierCounters.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/util
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/util/RandomSelectionStrategy.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/util
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/util/VerifierMapInitializer.java modules/dcache-qos/src/main/java/org/dcache/qos/services/verifier/util
