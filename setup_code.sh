# vscode
read -n1 -p "install vscode? (y/N): " yn
if [[ $yn = [yY] ]]; then
        sudo apt install curl
        curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
        sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
        sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.lis$
        sudo apt install apt-transport-https
        sudo apt update
        sudo apt install code

        code --install-extension ms-python.python
fi

