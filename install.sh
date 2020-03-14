#!/bin/bash


PASSWORD=$(whiptail --passwordbox "please enter your sudo password" 8 78 --title "Password for sudo install" 3>&1 1>&2 2>&3)

#prompt for check what install

whiptail --title "Ubuntu setup for developers" --checklist --separate-output \
"Choose the thecnologies to install.  " 20 78 10 \
"DOCKER" "Install docker CE  " OFF \
"KUBERNETES" "Install kubectl and minikube  " OFF \
"GOLANG" "Install golang last version  " ON \
"JAVA" "Install Oracle JDK 8  " ON \
"NODEJS" "install nodeJS support using NVM  " ON 2> results

while read choice
    do
    case $choice in
    DOCKER) echo "Installing docker"
    ;;
    KUBERNETES)  echo "installing kubernetes"
    ;;
    GOLANG) echo $PASSWORD | sudo --stdin ./scripts/golang.sh
    ;;
    JAVA) echo $PASSWORD | sudo --stdin ./scripts/java.sh
    ;;
    NODEJS)  ./scripts/nodejs.sh && [[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM
    ;;
    *) echo "Finish script"
    ;;
    esac
done < results

function install_golang() {
    echo $PASSWORD
}

# read -sp "password for execute sudo commands: " password 
# echo $password
# echo $password | sudo -S apt update