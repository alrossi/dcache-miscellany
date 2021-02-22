#!/bin/bash

#
# (12) QoS Junit Tests 1 (Miscellaneous)
#

mkdir -p modules/dcache-qos/src/test/java/org/dcache/qos/remote/receivers
mkdir -p modules/dcache-qos/src/test/java/org/dcache/qos/util

cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/test/java/org/dcache/qos/remote/receivers/QoSRequirementsReceiverTest.java modules/dcache-qos/src/test/java/org/dcache/qos/remote/receivers
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/test/java/org/dcache/qos/util/MessageGuardTest.java modules/dcache-qos/src/test/java/org/dcache/qos/util
cp /Work/fnal/dCache/sandbox/modules/dcache-qos/src/test/java/org/dcache/qos/util/NonReindexableListTest.java modules/dcache-qos/src/test/java/org/dcache/qos/util