#!/bin/sh

git pull
git submodule foreach git pull origin master
cd bundle/snipmate-snippets
git pull
