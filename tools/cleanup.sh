rm -f temp
mkdir temp
cd temp/
wget https://github.com/davidfoerster/aptsources-cleanup/releases/download/v0.1.6.6/aptsources-cleanup.zip
sudo python3 -OEs aptsources-cleanup.zip --yes