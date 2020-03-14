# search nvm installed
LIST_DIR=$(ls -la $HOME | grep --count .nvm)
if [ $LIST_DIR -eq  "0" ] 
then
    # installing NVM
    echo "Installing NodeJS Version mananger..."
    curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh -o install_nvm.sh
    bash install_nvm.sh
    echo "Installed $(node --version)"
else
    echo "NodeJS Version Mananger is already installed. Skiping..."
fi
# make nvm executable
chmod +x ~/.nvm/nvm.sh
# search nvm in PATH 
NVM_IN_PATH=$(cat $HOME/.bashrc | grep --count "export PATH=$PATH:$HOME/.nvm")
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM
# installing latest nodeJS
echo "Installing latest NodeJS version..."
nvm install node
nvm alias default node
nvm use default
rm -rf install_nvm.sh