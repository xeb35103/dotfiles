#!/bin/bash -x

# apt server
#sudo sed -i.bak -e "s%http://us.archive.ubuntu.com/ubuntu/%http://ftp.riken.go.jp/Linux/ubuntu/%g" /etc/apt/sources.list
#sudo sed -i.bak -e "s%http://us.archive.ubuntu.com/ubuntu/%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list
#sudo sed -i.bak -e "s%http://us.archive.ubuntu.com/ubuntu/%http://www.ftp.ne.jp/Linux/packages/ubuntu/archive/%g" /etc/apt/sources.list
#sudo sed -i.bak -e "s%http://\w\+%http://ftp.riken.go.jp/Linux/ubuntu/%g" /etc/apt/sources.list
sudo sed -i.bak -e "s%http://.*.ubuntu.com%http://ftp.jaist.ac.jp/pub/Linux%g" /etc/apt/sources.list

# apt update
sudo apt update
sudo apt upgrade -y

# time adjust
sudo timedatectl set-local-rtc true

# home directory
LANG=C xdg-user-dirs-gtk-update

# show date in panel
gsettings set org.gnome.desktop.interface clock-show-date true

# key binding
gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"
#gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:swapcaps']"

# emacs key binding
gsettings set org.gnome.desktop.interface gtk-key-theme Emacs

# network
sudo apt install -y ssh

# adobe flash plugin
sudo apt install -y adobe-flashplugin

# codecs
sudo apt install -y ubuntu-restricted-extras

# application
sudo apt install -y git etckeeper
sudo apt install -y silversearcher-ag mg jed meld
sudo apt install -y net-tools

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

# clean apt cache
sudo apt clean
