#!/bin/bash

echo "Start installatie op Kali Linux..."

# Repositories updaten
echo "👉 Repositories bijwerken..."
sudo apt-get update

# Nmap installeren
echo "🛠️ Nmap installeren..."
sudo apt-get install -y nmap

# Python 3 installeren
echo "🐍 Python 3 installeren..."
sudo apt-get install -y python3 python3-pip

# Java Development Kit installeren
echo "☕ OpenJDK installeren..."
sudo apt-get install -y default-jdk

# Build-tools voor Guest Additions
echo "🛠️ Build-tools voor Guest Additions installeren..."
sudo apt-get install -y build-essential dkms linux-headers-$(uname -r)

# VirtualBox Guest Additions installeren
echo "📀 VirtualBox Guest Additions installeren..."
sudo apt-get install -y virtualbox-guest-utils virtualbox-guest-x11

# Clone GitHub-repo
echo "🔗 GitHub-repository klonen..."
cd ~
git clone https://github.com/SanderSchepers1993/CyberSec25.git

# Console toetsenbordinstelling wijzigen naar Belgisch Azerty
echo "⌨️ Toetsenbordinstelling voor console aanpassen naar Belgisch azerty..."
sudo sed -i 's/XKBLAYOUT="us"/XKBLAYOUT="be"/' /etc/default/keyboard

# X11 toetsenbordinstelling wijzigen naar Belgisch Azerty
echo "⌨️ Toetsenbordinstelling voor X11 aanpassen naar Belgisch azerty..."
echo "Section \"InputClass\"
    Identifier \"keyboard-default\"
    MatchIsKeyboard \"on\"
    Option \"XkbLayout\" \"be\"
    Option \"XkbVariant\" \"nodeadkeys\"
EndSection" | sudo tee /etc/X11/xorg.conf.d/00-keyboard.conf

echo "✅ Installatie volledig voltooid!"

# Herstarten van het systeem
echo "🔄 Het systeem wordt herstart om de wijzigingen toe te passen..."
sudo reboot
