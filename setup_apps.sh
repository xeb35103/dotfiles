# vscode
read -n1 -p "install vscode? (y/N): " yn
if [[ $yn = [yY] ]]; then
	setup_app_vscode.sh
fi

# chrome
read -n1 -p "install chrome? (y/N): " yn
if [[ $yn = [yY] ]]; then
	setup_app_chrome.sh
fi

# PX4
read -n1 -p "install development tools for px4? (y/N): " yn
if [[ $yn = [yY] ]]; then
	setup_app_px4.sh
fi
	
# webots
read -n1 -p "install webots? (y/N): " yn
if [[ $yn = [yY] ]]; then
	setup_app_webots.sh
fi

# docker
read -n1 -p "install docker? (y/N): " yn
if [[ $yn = [yY] ]]; then
	setup_app_docker.sh
fi



