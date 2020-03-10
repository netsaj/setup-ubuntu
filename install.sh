#!/bin/bash
if [ ! `whoami` == root ]; then 
    echo 'Need sudo'
    exit
fi

#
apt update 
apt-get install -y git curl wget
apt-get install -y apt-transport-https ca-certificates curl software-properties-common

chmod +x installers/*

# install zsh
apt update
apt install zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s $(which zsh)

# golang
add-apt-repository -y ppa:longsleep/golang-backports
#docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -y –
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)  stable" 
# - chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add --yes -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

#cleaning ppa repositories
`tools/cleanup.sh`

sudo apt-get update
apt update
apt install -y golang-go
apt-get install -y docker-ce 
# apt install --yes opera-stable
apt-get install -y python3 python3-pip python3-venv
apt-get install google-chrome-stable
apt install kubectl
