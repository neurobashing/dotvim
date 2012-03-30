#!/usr/bin/python

import sys,subprocess
from urlparse import urlparse
from os import path

if len(sys.argv) < 2:
  exit('Please enter a Github URL yo.')
else:
  modurl = sys.argv[1]

giturl = urlparse(modurl) # argv 1
pathpart = path.basename(giturl.path)
# remove .git if it exists. this is our module name
modulename = pathpart.replace('.git','')

subprocess.call(["git","submodule","add",modurl,"bundle/"+modulename])
subprocess.call(["git","add","."])
subprocess.call(["git","config",'-f','.gitmodules',"submodule."+"bundle/"+modulename+".ignore","dirty"])
subprocess.call(["git","add",".gitmodules"])
subprocess.call(["git","commit","-m","added module "+modulename])
