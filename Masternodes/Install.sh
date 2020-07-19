#!/bin/sh
clear
echo "Starting ENCRYPT Masternode download and install script"
echo "Updating/Upgrading OS..."
sudo apt update && sudo apt upgrade -y
echo "Downloading EncryptNetwork latest build..."
wget -N https://github.com/EncryptNetwork/EncryptNetwork/releases/download/1.3.0.0/encrypt-1.3.0.0-linux.zip
echo "Installing unzip..."
sudo apt-get install unzip -y
echo "Unzipping latest zip..."
sudo unzip encrypt-1.3.0.0-linux.zip -d /usr/local/bin/
cd && sudo chmod +x /usr/local/bin/encrypt*
echo "Creating .encrypt directory..."
mkdir ~/.encrypt
cd ~/.encrypt
echo "Editing encrypt.conf..."
cat >> encrypt.conf <<'EOF'
rpcuser=someuserhere>> encrypt.conf
rpcpassword=somepasswordhere>> encrypt.conf
rpcallowip=127.0.0.1 >> encrypt.conf
server=1 >> encrypt.conf
daemon=1 >> encrypt.conf
listen=1 >> encrypt.conf
staking=0 >> encrypt.conf
logtimestamps=1 >> encrypt.conf
maxconnections=256 >> encrypt.conf
masternode=1 >> encrypt.conf
externalip= >> encrypt.conf
masternodeprivkey= >> encrypt.conf
EOF
echo "Setting up and enabling fail2ban..."
sudo apt-get install fail2ban -y
sudo ufw allow ssh
sudo ufw allow 2020
sudo ufw allow 2121
sudo ufw enable
echo "Launching encryptd..."
cd && cd /usr/local/bin
./encryptd --daemon
echo "Cleaning up..."
cd
rm -rf encrypt-1.3.0.0-linux.zip
echo "ENCRYPT Masternode installed successfully!"