#!/bin/sh
echo "remember to run 'git submodule init' if you've added stuff recently."
git pull
git submodule update
git submodule foreach git pull origin master
cd bundle/snipmate-snippets
git pull
echo "checking for empty bundle dirs; you need to run git submodule init"
find bundle -type d -empty \! -path "*/.git/*"