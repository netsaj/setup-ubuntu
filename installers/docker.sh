curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -y –
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)  stable" 
sudo apt-get update
sudo apt-get install -y docker-ce 