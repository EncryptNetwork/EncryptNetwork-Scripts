#!/bin/sh
clear
echo "Starting ENCRYPT Auto Config script"
echo "Stopping encryptd..."
encrypt-cli stop
cd ~/.encrypt
rm -rf encrypt.conf
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
externalip=yourexternaliphere>> encrypt.conf
masternodeprivkey=yourmasternodeprivkeyhere>> encrypt.conf
EOF
echo "Running encryptd..."
cd && cd /usr/local/bin
encryptd -daemon
echo "ENCRYPT Configuration completed!"