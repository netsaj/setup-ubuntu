#!/bin/bash
echo "Installing docker..."
echo $1 | sudo --stdin apt install --yes docker.io
echo "Start docker services"
echo $1 | sudo --stdin systemctl start docker
echo $1 | sudo --stdin systemctl enable docker
echo "adding user to docker group"
echo $1 | sudo --stdin usermod -aG docker ${USER}
