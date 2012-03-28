#!/usr/bin/python

import sys
import subprocess
import shutil

if len(sys.argv) < 2:
  exit('Please enter a module name, ie what is under bundles.')
else:
  modulename = sys.argv[1]

shutil.rmtree('bundle/'+modulename)

subprocess.call(["git","rm","-rf","bundle/"+modulename])
subprocess.call(['git','config','--remove-section',"submodule.bundle/"+modulename])
subprocess.call(['git','config','-f','.gitmodules','--remove-section',"submodule.bundle/"+modulename])
subprocess.call(["git","add","."])
subprocess.call(["git","commit","-m","removed module "+modulename])
