#!/bin/bash
set -e

echo "Start installatie op Kali Linux..."

echo "👉 Repositories bijwerken..."
sudo apt-get update

echo "🛠️ Java JDK en Python3 installeren..."
sudo apt-get install -y default-jdk python3 git

echo "⌨️ Toetsenbordinstelling aanpassen naar Belgisch azerty (console)..."
sudo sed -i 's/XKBLAYOUT="us"/XKBLAYOUT="be"/' /etc/default/keyboard

echo "⌨️ Toetsenbordinstelling aanpassen naar Belgisch azerty (X11)..."
sudo mkdir -p /etc/X11/xorg.conf.d/
cat << EOF | sudo tee /etc/X11/xorg.conf.d/00-keyboard.conf
Section "InputClass"
    Identifier "keyboard-default"
    MatchIsKeyboard "on"
    Option "XkbLayout" "be"
    Option "XkbVariant" "nodeadkeys"
EndSection
EOF

# Clone GitHub-repo
echo "🔗 GitHub-repository klonen..."
cd ~
git clone https://github.com/SanderSchepers1993/CyberSec25.git


echo "✅ Installatie volledig voltooid!"

# Herstarten van het systeem
echo "🔄 Het systeem wordt herstart om de wijzigingen toe te passen..."
sudo reboot
