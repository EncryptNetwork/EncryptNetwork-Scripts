#!/bin/sh
clear
echo "Starting ENCRYPT Auto Config script"
echo "Stopping encryptd..."
encrypt-cli stop
cd ~/.encrypt
rm -rf encrypt.conf
echo "Editing encrypt.conf..."
cat >> encrypt.conf <<'EOF'
rpcuser=someuserhere
rpcpassword=somepasswordhere
rpcallowip=127.0.0.1
server=1
daemon=1
listen=1
staking=0
logtimestamps=1
maxconnections=256
masternode=1
externalip=yourexternaliphere
masternodeprivkey=yourmasternodeprivkeyhere
EOF
echo "Running encryptd..."
cd && cd /usr/local/bin
encryptd -daemon
echo "ENCRYPT Configuration completed!"