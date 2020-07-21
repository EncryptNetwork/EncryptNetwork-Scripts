#!/bin/sh
clear
echo "Starting ENCRYPT Masternode update script"
cd && cd /usr/local/bin
echo "Stopping encryptd..."
encrypt-cli stop
echo "Deleting old scripts..."
cd && rm -rf enscripts
echo "Downloading new scripts..."
git clone https://github.com/getdzypher/EncryptNetwork-Scripts enscripts
chmod -R 755 enscripts
cd && cd /enscripts/Masternodes
echo "Downloading EncryptNetwork update..."
wget -N https://github.com/EncryptNetwork/EncryptNetwork/releases/download/1.3.0.0/encrypt-1.3.0.0-linux.zip
echo "Installing unzip..."
sudo apt-get install unzip -y
echo "Extracting update..."
sudo unzip encrypt-1.3.0.0-linux.zip -d /usr/local/bin/
echo "Set permissions on files..."
cd && sudo chmod +x /usr/local/bin/encrypt*
echo "Running encryptd..."
cd && cd /usr/local/bin
encryptd -daemon
echo "Cleaning up..."
cd && cd /enscripts/Masternodes
rm -rf encrypt-1.3.0.0-linux.zip
echo "ENCRYPT Update completed!"