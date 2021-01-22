#!/bin/bash

#
# (12) QoS Junit Tests 3 (verifier)
#

mkdir -p  modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/data
mkdir -p  modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/handlers
mkdir -p  modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/util

cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/data/FileQoSFilterTest.java modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/data
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/data/FileQoSOperationMapTest.java modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/data
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/data/PoolInfoChangeHandlerTest.java modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/data
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/data/PoolInfoMapTest.java modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/data
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/data/PoolInformationTest.java modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/data
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/handllers/FileQoSOperationHandlerTest.java modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/handlers
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/util/CacheableLocationExtractorTest.java modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/util
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/util/CopyLocationExtractorTest.java modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/util
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/util/LocationSelectorTest.java modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/util
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/util/PoolManagerInfoExtractorTest.java modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/util
