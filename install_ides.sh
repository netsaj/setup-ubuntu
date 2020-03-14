#!/bin/bash


#PASSWORD=$(whiptail --passwordbox "please enter your sudo password" 8 78 --title "Password for sudo install" 3>&1 1>&2 2>&3)
PASSWORD=$1
#prompt for check what install

whiptail --title "Ubuntu setup for developers" --checklist --separate-output \
"Choose the IDEs to install.  " 20 78 10 \
"01)" "Visual Studio Code  " OFF \
"02)" "Android Studio  " OFF \
"03)" "CLion for C and C++  " OFF \
"04)" "DataGrip, a IDE for SQL  " OFF \
"05)" "GoLand for Go  " OFF \
"06)" "IntelliJ IDEA Community for Java" OFF \
"07)" "IntelliJ IDEA Ultimate for Java  " OFF \
"08)" "PhpStorm, a PHP ide " OFF \
"09)" "PyCharm Community, for Python" OFF \
"10)" "PyCharm Professional, for Python  " OFF \
"11)" "RubyMine, for Ruby   " OFF \
"12)" "WebStorm, for HTML5, CSS3. JS/NodeJS" OFF \
"webstorm" "install CLion support using NVM  " OFF 2> .results

while read choice
    do
    case $choice in
    "01)") echo $PASSWORD | sudo --stdin ./scripts/ubuntu/ides/vscode.sh
    ;;
    "02)") echo $PASSWORD | sudo --stdin ./scripts/ubuntu/ides/android.sh
    ;;
    "03)") echo $PASSWORD | sudo -stdin ./scripts/ubuntu/ides/jetbrains.sh clion
    ;;
    "04)") echo $PASSWORD | sudo -stdin ./scripts/ubuntu/ides/jetbrains.sh datagrip
    ;;
    "05)") echo $PASSWORD | sudo -stdin ./scripts/ubuntu/ides/jetbrains.sh goland
    ;; 
    "06)") echo $PASSWORD | sudo -stdin ./scripts/ubuntu/ides/jetbrains.sh intellij-idea-community
    ;;
    "07)") echo $PASSWORD | sudo -stdin ./scripts/ubuntu/ides/jetbrains.sh intellij-idea-ultimate
    ;;
    "08)") echo $PASSWORD | sudo -stdin ./scripts/ubuntu/ides/jetbrains.sh phpstorm
    ;;
    "09)") echo $PASSWORD | sudo -stdin ./scripts/ubuntu/ides/jetbrains.sh pycharm-community
    ;;
    "10)") echo $PASSWORD | sudo -stdin ./scripts/ubuntu/ides/jetbrains.sh pycharm-professional
    ;;
    "11)") echo $PASSWORD | sudo -stdin ./scripts/ubuntu/ides/jetbrains.sh rubymine
    ;;
    "12)") echo $PASSWORD | sudo -stdin ./scripts/ubuntu/ides/jetbrains.sh webstorm
    ;;

    *) echo "Finish script" && ./setup.sh
    ;;
    esac
done < .results
$(rm -rf .results)
$(rm -rf strip)
./setup.sh $PASSWORD