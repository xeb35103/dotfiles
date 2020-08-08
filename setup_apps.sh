# vscode
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

# chrome
read -n1 -p "install chrome? (y/N): " yn
if [[ $yn = [yY] ]]; then
	curl https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
	sudo apt update
	sudo apt install google-chrome-stable
fi

# PX4
read -n1 -p "install development tools for px4? (y/N): " yn
if [[ $yn = [yY] ]]; then
	wget https://raw.githubusercontent.com/PX4/Devguide/v1.9.0/build_scripts/ubuntu_sim_ros_melodic.sh
	source ubuntu_sim_ros_melodic.sh
fi
	
# webots
read -n1 -p "install webots? (y/N): " yn
if [[ $yn = [yY] ]]; then
	wget -qO- https://cyberbotics.com/Cyberbotics.asc | sudo apt-key add -
	sudo apt-add-repository 'deb https://cyberbotics.com/debian/ binary-amd64/'
	sudo apt-get update
	sudo apt-get install webots
fi



