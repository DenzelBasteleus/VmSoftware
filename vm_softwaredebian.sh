#!/bin/bash

# Update de repositories en installeer benodigde software
echo "Repositories bijwerken..."
sudo apt-get update

# Vereiste software installeren
sudo apt install -y default-jdk wget

# Installeren van de build-tools voor Guest Additions
echo "Installeren van build-tools voor Guest Additions..."
sudo apt-get install -y build-essential dkms linux-headers-$(uname -r)

# Installeren van VirtualBox Guest Additions
echo "VirtualBox Guest Additions installeren..."
sudo apt-get install -y virtualbox-guest-utils virtualbox-guest-x11

# Git installeren en repository klonen
sudo apt-get install -y git
git clone https://github.com/SanderSchepers1993/CyberSec25.git
cd CyberSec25

# Toetsenbordinstellingen aanpassen naar BE AZERTY
echo "Toetsenbord wijzigen naar BE azerty..."
sudo sed -i 's/XKBLAYOUT=.*/XKBLAYOUT="be"/' /etc/default/keyboard
sudo dpkg-reconfigure -f noninteractive keyboard-configuration
sudo service keyboard-setup restart

echo "Installatie en koppelen aan git voltooid op Debian!"

# Herstart de VM automatisch
sudo reboot

