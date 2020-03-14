#!/bin/bash


#PASSWORD=$(whiptail --passwordbox "please enter your sudo password" 8 78 --title "Password for sudo install" 3>&1 1>&2 2>&3)
PASSWORD=$1
#prompt for check what install

whiptail --title "Ubuntu setup for developers" --checklist --separate-output \
"Choose the thecnologies to install.  " 20 78 10 \
"BASE" "Install base dependencies (NOT UNCHECK) " OFF \
"DOCKER" "Install docker CE  " OFF \
"KUBERNETES" "Install kubectl cli  " OFF \
"GCLOUD" "Install gcloud SDK  " OFF \
"PROTOTOOL" "Install uber/prototool  for compile proto files  " OFF \
"GOLANG" "Install golang last version  " OFF \
"JAVA" "Install Oracle JDK 8  " OFF \
"NODEJS" "install nodeJS support using NVM  " OFF 2> .results

while read choice
    do
    case $choice in
    BASE) echo $PASSWORD | sudo --stdin ./scripts/ubuntu/dependencies/dependencies.sh
    ;;
    DOCKER) ./scripts/ubuntu/dependencies/docker.sh $PASSWORD
    ;;
    KUBERNETES)  echo $PASSWORD | sudo --stdin ./scripts/ubuntu/dependencies/kubernetes.sh
    ;;
    GCLOUD)  echo $PASSWORD | sudo --stdin ./scripts/ubuntu/dependencies/gcloud.sh
    ;;
    PROTOTOOL)  echo $PASSWORD | sudo --stdin ./scripts/ubuntu/dependencies/prototool.sh
    ;;
    GOLANG) echo $PASSWORD | sudo --stdin ./scripts/ubuntu/dependencies/golang.sh
    ;;
    JAVA) echo $PASSWORD | sudo --stdin ./scripts/ubuntu/dependencies/java.sh
    ;;
    NODEJS)  ./scripts/ubuntu/dependencies/nodejs.sh && [[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM
    ;;
    *) echo "Finish script" && ./setup.sh
    ;;
    esac
done < .results
$(rm -rf .results)
$(rm -rf strip)
./setup.sh $PASSWORD