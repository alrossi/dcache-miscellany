#!/bin/sh

VERSION=$1

rm -f /usr/java/default
ln -s /usr/java/$VERSION /usr/java/default

java -version
