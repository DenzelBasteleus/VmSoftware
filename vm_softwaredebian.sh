#!/bin/bash

# Update de repositories en installeer benodigde software
echo "Repositories bijwerken..."
sudo apt-get update

echo "Apache2 installeren..."
sudo apt-get install -y apache2

# Installeren van de build-tools voor Guest Additions
echo "Installeren van build-tools voor Guest Additions..."
sudo apt-get install -y build-essential dkms linux-headers-$(uname -r)

# Installeren van VirtualBox Guest Additions
echo "VirtualBox Guest Additions installeren..."
sudo apt-get install -y virtualbox-guest-utils virtualbox-guest-x11

sudo apt-get install git  # Installeer Git als je het nog niet hebt
git clone https://github.com/SanderSchepers1993/CyberSec25.git
cd CyberSec25

echo "Installatie en koppelen aan git voltooid op Debian!"
