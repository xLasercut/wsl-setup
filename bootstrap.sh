#!/bin/bash

current_user=$(whoami)

if [[ ${current_user} == "root" ]]; then
  echo "logged in as root. please switch users first"
  exit 1
fi

sudo apt update
sudo apt install zsh build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev git

git clone https://github.com/zsh-users/antigen.git ~/antigen

curl "https://raw.githubusercontent.com/xLasercut/my-zsh/master/.zshrc" --output "${HOME}/.zshrc"
curl "https://raw.githubusercontent.com/xLasercut/my-zsh/master/.p10k.zsh" --output "${HOME}/.p10k.zsh"
sudo cp ./roles/wsl_config/files/wsl.conf /etc

chsh -s /bin/zsh
