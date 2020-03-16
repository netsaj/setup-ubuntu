#!/bin/bash
REPO_EXIST=$(ls /etc/apt/sources.list.d | grep --count jetbrains-ppa.list)
if [ $REPO_EXIST -eq 0 ]; then
    curl -s https://s3.eu-central-1.amazonaws.com/jetbrains-ppa/0xA6E8698A.pub.asc | sudo apt-key add -
    echo "deb http://jetbrains-ppa.s3-website.eu-central-1.amazonaws.com bionic main" | sudo tee /etc/apt/sources.list.d/jetbrains-ppa.list > /dev/null
    sudo apt-get update
fi


apt-get install --yes $1