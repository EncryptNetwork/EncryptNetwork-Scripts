#!/bin/sh
clear
echo "Starting ENCRYPT Masternode update script"
echo "Stopping encryptd..."
encrypt-cli stop
echo "Downloading EncryptNetwork update..."
wget -N https://github.com/EncryptNetwork/EncryptNetwork/releases/download/1.3.0.0/encrypt-1.3.0.0-linux.zip
echo "Installing unzip..."
sudo apt-get install unzip -y
echo "Extracting update..."
sudo unzip -jo encrypt-1.3.0.0-linux.zip -d /usr/local/bin
echo "Set permissions on files..."
sudo chmod +x /usr/local/bin/encrypt*
echo "Running encryptd..."
encryptd -daemon
echo "Cleaning up..."
cd
rm -rf encrypt-1.3.0.0-linux.zip
echo "ENCRYPT Update completed!"