#!/bin/bash

#
# (14) QoS properties and batch files
#

mkdir -p skel/var/qos
cp /Work/fnal/dCache/qos/packages/fhs/src/main/assembly/filter.properties packages/fhs/src/main/assembly
cp /Work/fnal/dCache/qos/packages/fhs/src/main/rpm/dcache-server.spec packages/fhs/src/main/rpm
cp /Work/fnal/dCache/qos/packages/pom.xml packages
cp /Work/fnal/dCache/qos/packages/system-test/src/main/assembly/filter.properties packages/system-test/src/main/assembly
cp /Work/fnal/dCache/qos/packages/tar/src/main/assembly/filter.properties packages/tar/src/main/assembly
cp /Work/fnal/dCache/qos/skel/etc/logback.xml skel/etc
cp /Work/fnal/dCache/qos/skel/share/defaults/dcache.properties skel/share/defaults
cp /Work/fnal/dCache/qos/skel/share/defaults/paths.properties skel/share/defaults
cp /Work/fnal/dCache/qos/skel/share/defaults/pool.properties skel/share/defaults
cp /Work/fnal/dCache/qos/skel/share/defaults/qos.properties skel/share/defaults
cp /Work/fnal/dCache/qos/skel/share/services/pool.batch skel/share/services 
cp /Work/fnal/dCache/qos/skel/share/services/qos-adjuster.batch skel/share/services 
cp /Work/fnal/dCache/qos/skel/share/services/qos-engine.batch skel/share/services 
cp /Work/fnal/dCache/qos/skel/share/services/qos-scanner.batch skel/share/services 
cp /Work/fnal/dCache/qos/skel/share/services/qos-verifier.batch skel/share/services 
cp /Work/fnal/dCache/qos/skel/share/services/qos.batch skel/share/services 
cp /Work/fnal/dCache/qos/skel/var/qos/.empty-dir skel/var/qos

