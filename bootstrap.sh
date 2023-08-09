#!/bin/bash

current_user=$(whoami)

if [[ ${current_user} == "root" ]]; then
  echo "logged in as root. please switch users first"
  exit 1
fi

sudo zypper ref
sudo zypper install zsh git gcc automake bzip2 libbz2-devel xz xz-devel openssl-devel ncurses-devel readline-devel zlib-devel tk-devel libffi-devel sqlite3-devel gdbm-devel make findutils patch
sudo zypper install -t pattern wsl_base wsl_systemd wsl_gui

git clone https://github.com/zsh-users/antigen.git ~/antigen

curl "https://raw.githubusercontent.com/xLasercut/my-zsh/master/.zshrc" --output "${HOME}/.zshrc"
curl "https://raw.githubusercontent.com/xLasercut/my-zsh/master/.p10k.zsh" --output "${HOME}/.p10k.zsh"
sudo cp ./roles/wsl_config/files/wsl.conf /etc

chsh -s /bin/zsh

/bin/zsh ~/.zshrc
