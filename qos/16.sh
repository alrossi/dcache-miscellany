#!/bin/bash

#
# (16) Bulk support of QoS Engine
#

mkdir -p  modules/dcache-bulk/src/main/java/org/dcache/services/bulk/plugins/qosengine
cp /Work/fnal/dCache/qos/modules/dcache-bulk/src/main/java/org/dcache/services/bulk/QoSEngineAware.java modules/dcache-bulk/src/main/java/org/dcache/services/bulk
cp /Work/fnal/dCache/qos/modules/dcache-bulk/src/main/java/org/dcache/services/bulk/job/BulkJobFactory.java modules/dcache-bulk/src/main/java/org/dcache/services/bulk/job
cp /Work/fnal/dCache/qos/modules/dcache-bulk/src/main/java/org/dcache/services/bulk/plugins/qosengine/UpdateQoSJob.java modules/dcache-bulk/src/main/java/org/dcache/services/bulk/plugins/qosengine
cp /Work/fnal/dCache/qos/modules/dcache-bulk/src/main/java/org/dcache/services/bulk/plugins/qosengine/UpdateQoSJobProvider.java modules/dcache-bulk/src/main/java/org/dcache/services/bulk/plugins/qosengine
cp /Work/fnal/dCache/qos/modules/dcache-bulk/src/main/java/org/dcache/services/bulk/util/QoSResponseReceiver.java modules/dcache-bulk/src/main/java/org/dcache/services/bulk/util
cp /Work/fnal/dCache/qos/modules/dcache-bulk/src/main/resources/META-INF/services/org.dcache.services.bulk.job.BulkJobProvider modules/dcache-bulk/src/main/resources/META-INF/services
cp /Work/fnal/dCache/qos/modules/dcache-bulk/src/main/resources/org/dcache/services/bulk/bulk.xml modules/dcache-bulk/src/main/resources/org/dcache/services/bulk
cp /Work/fnal/dCache/qos/skel/share/defaults/bulk.properties skel/share/defaults
cp /Work/fnal/dCache/qos/skel/share/services/bulk.batch skel/share/services

