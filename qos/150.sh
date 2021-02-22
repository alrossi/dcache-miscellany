#!/bin/bash

#
# (15) Frontend support of QoS Engine
#

cp /Work/fnal/dCache/sandbox/modules/dcache-frontend/src/main/java/org/dcache/restful/resources/namespace/FileResources.java modules/dcache-frontend/src/main/java/org/dcache/restful/resources/namespace
cp /Work/fnal/dCache/sandbox/modules/dcache-frontend/src/main/resources/org/dcache/frontend/frontend.xml modules/dcache-frontend/src/main/resources/org/dcache/frontend
cp /Work/fnal/dCache/sandbox/skel/share/defaults/frontend.properties skel/share/defaults
cp /Work/fnal/dCache/sandbox/skel/share/services/frontend.batch skel/share/services

