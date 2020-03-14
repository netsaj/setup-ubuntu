#!/bin/bash
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - 
REPO_EXIST=$(cat /etc/apt/sources.list | grep --count "deb http://apt.kubernetes.io/ kubernetes-xenial main")
if [ $REPO_EXIST -eq 0 ]
then
    echo "adding repository to sources.list"
    apt-add-repository -y "deb http://apt.kubernetes.io/ kubernetes-xenial main"
    apt update
fi
apt install --yes kubectl