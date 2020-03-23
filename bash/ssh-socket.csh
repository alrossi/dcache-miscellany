#!/bin/tcsh

set socket = /tmp/$USER-hyak-socket

if ( ! -e $socket ) then
# -S: use/create socket
# -f: background
# -M: master mode (for tunnel)
# -N: do not execute remote command
	ssh -S $socket -fMN arossi55@hyak.washington.edu
endif

if ( ! -e $socket ) then
	echo "hyak: unable to create ssh socket '$socket'"
	exit 1
endif

# -S: use socket
# -Y: enable trusted X11 forwarding
ssh -S $socket -Y arossi@hyak.washington.edu
