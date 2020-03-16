#!/bin/bash
PASSWORD=$1
curl -o code.deb -L http://go.microsoft.com/fwlink/?LinkID=760868 
echo $PASSWORD | sudo --stdin sudo apt install --yes ./code.deb
rm -rf ./code.deb
