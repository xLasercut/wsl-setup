#!/bin/bash

git submodule init
git submodule update
git submodule update --recursive --remote

# update system
sudo apt-get update
sudo sudo apt-get install zsh

pushd ./linux-home-config
source linux_setup.sh
linux_setup setup base
linux_setup executables
popd

sudo sudo apt-get install zsh

chsh -s /bin/zsh
