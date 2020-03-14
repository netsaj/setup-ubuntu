#!/bin/bash

PASSWORD=""
if [ -z "$1" ]
then
    PASSWORD=$(whiptail --passwordbox "please enter your sudo password" 8 78 --title "Password for sudo install" 3>&1 1>&2 2>&3)
else
    PASSWORD=$1
fi

CHOISE=$(
    whiptail --title "Setup ubuntu for developers - Tool" --menu "Choose an option" 25 78 16 \
    "01)" "Install dependencies, code languages and dev tools." \
    "02)" "Install databases and admin GUIs" \
    "03)" "Install IDEs" \
    "04)" "Install tools" \
    "05)" "Customize and install themes" 3>&2 2>&1 1>&3	
)
echo ${CHOISE}

if  [ "${CHOISE}" = "01)" ]
then
    ./install_dependencies.sh $PASSWORD
elif [ "${CHOISE}" = "02)" ]; then
    ./install_ides.sh $PASSWORD
fi
