#!/bin/bash

export ADD_EXECUTABLE=1

git submodule init
git submodule update

pushd ./linux-home-config
./setup.sh
popd

sudo sudo apt-get install zsh

chsh -s /bin/zsh
