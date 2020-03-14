#opera
wget -qO- https://deb.opera.com/archive.key | sudo apt-key add --yes -
sudo add-apt-repository --yes "deb [arch=i386,amd64] https://deb.opera.com/opera-stable/ stable non-free"
apt update
apt install opera-stable