#!/bin/bash
set -e

echo "Start installatie op Kali Linux..."

echo "👉 Repositories bijwerken..."
sudo apt-get update

echo "🛠️ Nmap installeren..."
sudo apt-get install -y nmap git python3 python3-pip default-jdk build-essential dkms virtualbox-guest-utils virtualbox-guest-x11

echo "☕ Probeer linux headers te installeren..."
sudo apt-get install -y linux-headers-$(uname -r) || echo "Linux headers niet beschikbaar voor deze kernel"

echo "🔗 GitHub-repository klonen..."
cd ~
git clone https://github.com/SanderSchepers1993/CyberSec25.git

echo "⌨️ Toetsenbordinstelling voor console aanpassen naar Belgisch azerty..."
sudo sed -i 's/XKBLAYOUT="us"/XKBLAYOUT="be"/' /etc/default/keyboard

echo "⌨️ Toetsenbordinstelling voor X11 aanpassen naar Belgisch azerty..."
sudo mkdir -p /etc/X11/xorg.conf.d/
echo "Section \"InputClass\"
    Identifier \"keyboard-default\"
    MatchIsKeyboard \"on\"
    Option \"XkbLayout\" \"be\"
    Option \"XkbVariant\" \"nodeadkeys\"
EndSection" | sudo tee /etc/X11/xorg.conf.d/00-keyboard.conf

echo "✅ Installatie volledig voltooid!"

echo "🔄 Het systeem wordt herstart om de wijzigingen toe te passen..."

