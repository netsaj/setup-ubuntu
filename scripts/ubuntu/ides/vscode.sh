#!/bin/bash
REPO_EXIST=$(ls /etc/apt/sources.list.d | grep --count vscode.list)
if [ $REPO_EXIST -eq 0 ]; then
    wget -O - https://tagplus5.github.io/vscode-ppa/ubuntu/gpg.key | apt-key add - && \
    wget -O /etc/apt/sources.list.d/vscode.list https://tagplus5.github.io/vscode-ppa/ubuntu/vscode.list && \
    apt update
fi

apt install code