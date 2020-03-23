#!/usr/bin/env python

import os
import sys

from os import O_WRONLY,O_SYNC

if __name__ == '__main__':
        file = ".(suri)(" + sys.argv[1] + ")"
        
#	print 'checking	existence', os.path.exists(file)

#        with open(file, 'r') as f:
#                print f.readlines()
	
#        with open(file,	'w') as	f:
#                f.write("garbage")

#        with open(file,	'r') as	f:
#                print f.readlines()

#        print 'open trucate'

#	try:
#        	f = open(file, 'w') 
#        except IOError, e:
#		print e

#	f.close()

	print 'appending "garbage" again'
	
	f = os.open(file, O_WRONLY | O_SYNC)
	os.write(f, "garbage")
	f.close()
