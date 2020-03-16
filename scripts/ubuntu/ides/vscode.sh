#!/bin/bash
PASSWORD=$1
echo $PASSWORD | sudo --stdin apt install snapd
SNAPD_IN_PATH=$(cat $HOME/.bashrc | grep --count "export PATH=/snap/bin:")
if [ $SNAPD_IN_PATH -eq "0" ]; then
    echo "export PATH=/snap/bin:\$PATH" >> ~/.bashrc
fi
export PATH=/snap/bin:PATH
echo $PASSWORD | sudo --stdin systemctl start snapd.service
echo $PASSWORD | sudo --stdin snap install --classic code