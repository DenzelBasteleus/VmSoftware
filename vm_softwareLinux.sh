#!/bin/bash

echo "🔧 Start installatie op Kali Linux..."

# Voeg Kali GPG key toe
echo "👉 Kali repository GPG key toevoegen..."
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ED65462EC8D5E4C5 || true

# Repositories updaten
echo "👉 Repositories bijwerken..."
sudo apt update

# Herstellen van broken of half geïnstalleerde pakketten
echo "🔄 Herstellen van gebroken pakketten..."
sudo apt --fix-broken install -y
sudo dpkg --configure -a

# Verwijder eventuele held packages
echo "🔓 Controleren op held packages..."
held_packages=$(dpkg --get-selections | grep hold | awk '{print $1}')
if [ -n "$held_packages" ]; then
  echo "👉 Verwijderen van held packages..."
  for pkg in $held_packages; do
    sudo apt-mark unhold "$pkg"
  done
else
  echo "✅ Geen held packages gevonden."
fi

# Vereiste software installeren
echo "🛠 Java JDK en Python3 installeren..."
sudo apt install -y default-jre default-jre-headless python3

echo "👉 koppelen aan de github"
sudo apt-get install -y git
git clone https://github.com/SanderSchepers1993/CyberSec25.git
cd CyberSec25

echo "👉 Toetsenbord instellen op Belgisch AZERTY..."

# Toetsenbordinstellingen aanpassen naar BE AZERTY
echo "Toetsenbord wijzigen naar BE azerty..."
sudo sed -i 's/XKBLAYOUT=.*/XKBLAYOUT="be"/' /etc/default/keyboard
sudo dpkg-reconfigure -f noninteractive keyboard-configuration
sudo service keyboard-setup restart

# Afronden en herstarten
echo "✅ Installatie voltooid!"
echo "♻️ Het systeem wordt nu automatisch herstart..."
sudo reboot

