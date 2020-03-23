#!/bin/bash

ssh root@fndcatemp1.fnal.gov "rm -rf /usr/share/dcache/dcache-view"
scp -r target root@fndcatemp1.fnal.gov:/usr/share/dcache/dcache-view
ssh root@fndcatemp1.fnal.gov "dcache restart frontendDomain"

