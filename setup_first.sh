# apt update
sudo apt update
sudo apt upgrade

# time adjust
sudo timedatectl set-local-rtc true

# home directory
LANG=C xdg-user-dirs-gtk-update

# application
sudo apt install git etckeeper silversearcher-ag mg jed meld

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

# vscode
sudo apt install curl
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt install apt-transport-https
sudo apt update
sudo apt install code

# chrome
curl https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update
sudo apt install google-chrome-stable
wget https://raw.githubusercontent.com/PX4/Devguide/v1.9.0/build_scripts/ubuntu_sim_ros_melodic.sh
source ubuntu_sim_ros_melodic.sh

#
bash setup_ros.sh



