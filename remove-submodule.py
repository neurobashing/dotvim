#!/usr/bin/python

# remove entry from .gitmodules
# remove entry from .git/config
# then run git rm --cached path/to/submodule
# add and commit.
import sys,subprocess
from os import path

if len(sys.argv) < 2:
  exit('Please enter a module name, eg what is under bundles.')
else:
  modulename = sys.argv[1]

subprocess.call(['git','config','--remove-section',"submodule.bundle/"+modulename])
subprocess.call(['git','config','-f','.gitmodules','--remove-section',"submodule.bundle/"+modulename])
subprocess.call(["git","rm","--cached","bundle/"+modulename])
subprocess.call(["git","add","."])
subprocess.call(["git","commit","-m","removed module "+modulename])
