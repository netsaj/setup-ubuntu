#!/bin/bash
LIST_DIR=$(ls /etc/apt/sources.list.d | grep --count longsleep-ubuntu-golang-backports )
if [ $LIST_DIR -eq  "0" ] 
then
    echo "Adding repository"
    add-apt-repository -y ppa:longsleep/golang-backports
else
    echo "Repository exist... installing"
fi
apt update
apt install -y golang-go