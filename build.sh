#!/bin/sh

cd ~/tmp
git clone git://github.com/b4winckler/macvim.git
cd macvim/src
./configure --with-features=huge \
              --enable-rubyinterp \
              --enable-pythoninterp \
              --enable-perlinterp \
              --enable-cscope \
              --enable-luainterp
cd MacVim/icons
make getenvy
make all
cd ../..
make
open MacVim/build/Release
