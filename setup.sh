#!/usr/bin/bash 

# setup for nushell 

echo "installing nushell "

echo "[gemfury-nushell]
name=Gemfury Nushell Repo
baseurl=https://yum.fury.io/nushell/
enabled=1
gpgcheck=0
gpgkey=https://yum.fury.io/nushell/gpg.key" | sudo tee /etc/yum.repos.d/fury-nushell.repo
sudo dnf install -y nushell

echo "setiing up the config for nushell"
mkdir -p ~/.config/nushell/ 
rm -rf ~/.config/nushell/* 
cp -r ./* ~/.config/nushell/ 

echo "installation compelete"
