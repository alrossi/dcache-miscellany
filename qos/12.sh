#!/bin/bash

#
# (12) QoS Junit Tests
#

mkdir -p modules/dcache-qos/src/test/java/org/dcache/qos
mkdir -p modules/dcache-qos/src/test/java/org/dcache/qos/remote/receivers
mkdir -p modules/dcache-qos/src/test/java/org/dcache/qos/util
mkdir -p  modules/dcache-qos/src/test/java/org/dcache/qos/services/scanner/data
mkdir -p  modules/dcache-qos/src/test/java/org/dcache/qos/services/scanner/handlers
mkdir -p  modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/data
mkdir -p  modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/handlers
mkdir -p  modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/util

cp /Work/fnal/dCache/qos/modules/dcache-qos/src/test/java/org/dcache/qos/TestBase.java modules/dcache-qos/src/test/java/org/dcache/qos
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/test/java/org/dcache/qos/TestCostModule.java modules/dcache-qos/src/test/java/org/dcache/qos
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/test/java/org/dcache/qos/TestData.java modules/dcache-qos/src/test/java/org/dcache/qos
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/test/java/org/dcache/qos/TestMessageProcessor.java modules/dcache-qos/src/test/java/org/dcache/qos
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/test/java/org/dcache/qos/TestNamespaceAccess.java modules/dcache-qos/src/test/java/org/dcache/qos
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/test/java/org/dcache/qos/TestNotifyProcessor.java modules/dcache-qos/src/test/java/org/dcache/qos
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/test/java/org/dcache/qos/TestPoolMonitor.java modules/dcache-qos/src/test/java/org/dcache/qos
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/test/java/org/dcache/qos/TestSelectionUnit.java modules/dcache-qos/src/test/java/org/dcache/qos
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/test/java/org/dcache/qos/TestStub.java modules/dcache-qos/src/test/java/org/dcache/qos
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/test/java/org/dcache/qos/TestSynchronousExecutor.java modules/dcache-qos/src/test/java/org/dcache/qos
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/test/java/org/dcache/qos/remote/receivers/QoSRequirementsReceiverTest.java modules/dcache-qos/src/test/java/org/dcache/qos/remote/receivers
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/test/java/org/dcache/qos/util/MessageGuardTest.java modules/dcache-qos/src/test/java/org/dcache/qos/util
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/test/java/org/dcache/qos/services/scanner/data/PoolFilterTest.java modules/dcache-qos/src/test/java/org/dcache/qos/services/scanner/data
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/test/java/org/dcache/qos/services/scanner/data/PoolOpChangeHandlerTest.java modules/dcache-qos/src/test/java/org/dcache/qos/services/scanner/data
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/test/java/org/dcache/qos/services/scanner/data/PoolOperationMapTest.java modules/dcache-qos/src/test/java/org/dcache/qos/services/scanner/data
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/test/java/org/dcache/qos/services/scanner/data/PoolStatusTransitionTest.java modules/dcache-qos/src/test/java/org/dcache/qos/services/scanner/data
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/test/java/org/dcache/qos/services/scanner/handlers/PoolOperationHandlerTest.java modules/dcache-qos/src/test/java/org/dcache/qos/services/scanner/handlers
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/data/FileQoSFilterTest.java modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/data
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/data/FileQoSOperationMapTest.java modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/data
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/data/PoolInfoChangeHandlerTest.java modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/data
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/data/PoolInfoMapTest.java modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/data
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/data/PoolInformationTest.java modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/data
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/handllers/FileQoSOperationHandlerTest.java modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/handlers
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/util/CacheableLocationExtractorTest.java modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/util
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/util/CopyLocationExtractorTest.java modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/util
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/util/LocationSelectorTest.java modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/util
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/util/PoolManagerInfoExtractorTest.java modules/dcache-qos/src/test/java/org/dcache/qos/services/verifier/util
cp /Work/fnal/dCache/qos/modules/dcache-qos/src/test/java/org/dcache/qos/util/NonReindexableListTest.java modules/dcache-qos/src/test/java/org/dcache/qos/util
