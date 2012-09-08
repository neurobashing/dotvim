#!/bin/sh
echo "remember to run 'git submodule init' if you've added stuff recently."
git pull
git submodule update
git submodule foreach git pull origin master
cd bundle/snipmate-snippets
git pull origin master
cd ~/.vim/bundle/vim-powerline
git checkout develop
git pull origin develop
