#!/bin/bash
REPO_EXIST=$(ls /etc/apt/sources.list.d | grep --count google-cloud-sdk.list)
if [ $REPO_EXIST -eq 0 ]
then
    echo "Adding repository for gCloud SDK ..."
    # Add the Cloud SDK distribution URI as a package source
    echo "deb http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
    # Import the Google Cloud Platform public key
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
fi
# Update the package list and install the Cloud SDK
apt-get update
apt-get install --yes google-cloud-sdk