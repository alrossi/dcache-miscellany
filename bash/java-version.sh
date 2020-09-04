#!/bin/sh

VERSION=$1

rm -f /opt/java/default
ln -s /opt/java/$VERSION /opt/java/default

java -version
