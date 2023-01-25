#!/bin/bash

git submodule init
git submodule update
git submodule update --recursive --remote

# update system
sudo apt-get update
sudo sudo apt-get install zsh libxss1 libfuse2 software-properties-common unzip
sudo add-apt-repository ppa:appimagelauncher-team/stable
sudo apt-get update
sudo apt-get install appimagelauncher

pushd ./linux-home-config
source linux_setup.sh
linux_setup setup base
linux_setup executables
popd

echo $'export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk \'{print $2; exit;}\'):0.0' >> ~/.zshrc
echo 'export PATH="$HOME/.local/share/JetBrains/Toolbox/scripts:$PATH"' >> ~/.zshrc
