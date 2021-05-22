#!/bin/bash -x

# apt server
#sudo sed -i.bak -e "s%http://us.archive.ubuntu.com/ubuntu/%http://ftp.riken.go.jp/Linux/ubuntu/%g" /etc/apt/sources.list
#sudo sed -i.bak -e "s%http://us.archive.ubuntu.com/ubuntu/%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list
#sudo sed -i.bak -e "s%http://us.archive.ubuntu.com/ubuntu/%http://www.ftp.ne.jp/Linux/packages/ubuntu/archive/%g" /etc/apt/sources.list
#sudo sed -i.bak -e "s%http://\w\+%http://ftp.riken.go.jp/Linux/ubuntu/%g" /etc/apt/sources.list
#sudo sed -i.bak -e "s%http://.*.ubuntu.com%http://ftp.jaist.ac.jp/pub/Linux%g" /etc/apt/sources.list

# apt update
sudo apt update
sudo apt upgrade

# time adjust
sudo timedatectl set-local-rtc true

# home directory
LANG=C xdg-user-dirs-gtk-update

# network
sudo apt install ssh

# application
sudo apt install git etckeeper
sudo apt install silversearcher-ag mg jed meld
sudo apt install net-tools

# dotfiles
cd ~
if [ -d ${HOME}/dotfiles ]; then
    echo "dotfiles is already exist."
else
    git clone https://github.com/xeb35103/dotfiles.git
    cd dotfiles/
    git checkout ubuntu18.04
    ./linkAll.sh
fi;

