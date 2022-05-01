#!/bin/bash

export ADD_EXECUTABLE=1

git submodule init
git submodule update

sudo zypper ref
sudo zypper dup --no-recommends

pushd ./linux-home-config
./setup.sh
popd

sudo zypper install --no-recommends zsh youtube-dl

chsh -s /bin/zsh