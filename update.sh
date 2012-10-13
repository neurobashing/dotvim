#!/bin/sh
git pull origin master
git submodule init
git submodule update
git submodule foreach git pull origin master
cd bundle/snipmate-snippets
git pull origin master
cd ~/.vim/bundle/vim-powerline
git checkout develop
git pull origin develop
