# vscode
if which code; then
	echo "code was already installed"
else
	read -n1 -p "install vscode? (y/N): " yn
	if [[ $yn = [yY] ]]; then
		sudo apt install curl
		curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
		sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
		sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
		sudo apt install apt-transport-https
		sudo apt update
		sudo apt install code
	fi
fi

if which code; then
	# install extension
	code --install-extension austin.code-gnu-global
	code --install-extension eamodio.gitlens
	code --install-extension lfs.vscode-emacs-friendly
	code --install-extension mhutchie.git-graph
	code --install-extension MS-CEINTL.vscode-language-pack-ja
	code --install-extension ms-dotnettools.csharp
	code --install-extension ms-python.python
	code --install-extension ms-vscode.cpptools
	code --install-extension platformio.platformio-ide
	code --install-extension VisualStudioExptTeam.vscodeintellicode
	
	# update extension
	code --list-extensions | xargs -I {} code --install-extension {} --force

	# list extension
	code --list-extensions
fi

# chrome
if which chrome; then
	echo "chrome was already installed"
else
	read -n1 -p "install chrome? (y/N): " yn
	if [[ $yn = [yY] ]]; then
		curl https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
		echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
		sudo apt update
		sudo apt install google-chrome-stable
	fi
fi

# PX4
if [ -e ~/src/Firmware ]; then
	echo "development tools for px4 was already installed"
else
	read -n1 -p "install development tools for px4? (y/N): " yn
	if [[ $yn = [yY] ]]; then
		wget https://raw.githubusercontent.com/PX4/Devguide/v1.9.0/build_scripts/ubuntu_sim_ros_melodic.sh
		source ubuntu_sim_ros_melodic.sh
	fi
fi
	
# webots
if which webots; then
	echo "webots was already installed"
else
	read -n1 -p "install webots? (y/N): " yn
	if [[ $yn = [yY] ]]; then
		wget -qO- https://cyberbotics.com/Cyberbotics.asc | sudo apt-key add -
		sudo apt-add-repository 'deb https://cyberbotics.com/debian/ binary-amd64/'
		sudo apt-get update
		sudo apt-get install webots
	fi
fi

# emacs26
if which emacs26; then
	echo "emacs26 was already installed"
else
	read -n1 -p "install emacs26? (y/N): " yn
	if [[ $yn = [yY] ]]; then
		sudo add-apt-repository ppa:kelleyk/emacs
		sudo apt-get update
		sudo apt-get install emacs26

		git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
	fi
fi

