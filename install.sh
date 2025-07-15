#!/bin/bash
set -e  # Exit on error

# Log output to install.log
exec > >(tee -i install.log)
exec 2>&1

echo "🔧 Updating package list..."
sudo apt update

echo "🖥️ Installing GNOME components..."
sudo apt -y install \
  gnome-core gnome-tweaks libproxy1-plugin-networkmanager network-manager-gnome \
  file-roller gnome-software-plugin-flatpak gnome-extra-icons \
  gnome-shell-extension-manager gnome-shell-extension-tiling-assistant \
  gnome-shell-extension-blur-my-shell gnome-shell-extension-dashtodock \
  gnome-shell-extension-runcat

echo "📦 Installing APT applications..."
sudo apt -y install \
  libavcodec-extra ffmpeg mpv qbittorrent timeshift tldr neofetch openssh-server \
  synaptic curl wget lshw stacer cpu-x btop lm-sensors preload gamemode \
  xfce4-terminal libreoffice-writer firefox-esr mixxx yuzu easytag \
  obsidian-icon-theme fonts-recommended fonts-firacode fonts-jetbrains-mono \
  variety kiwix foliate

echo "📦 Installing Flatpak and adding Flathub..."
sudo apt -y install flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "📦 Installing Flatpak applications..."
flatpak install --noninteractive flathub \
  tv.plex.PlexDesktop \
  com.github.tchx84.Flatseal \
  it.mijorus.gearlever \
  org.feichtmeier.Musicpod \
  com.usebottles.bottles \
  io.gitlab.news_flash.NewsFlash \
  de.schmidhuberj.tubefeeder

echo "🌬️ Installing CoolerControl..."
curl -1sLf 'https://dl.cloudsmith.io/public/coolercontrol/coolercontrol/setup.deb.sh' | sudo -E bash
sudo apt -y install coolercontrol
sudo systemctl enable --now coolercontrold

echo "📡 Installing Speedtest CLI..."
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
sudo apt -y install speedtest

echo "🔐 Installing Bitwarden..."
wget "https://vault.bitwarden.com/download/?app=desktop&platform=linux&variant=deb" -O bitwarden.deb
sudo apt install ./bitwarden.deb

echo "📝 Installing Joplin..."
wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash

echo "🛡️ Setting up UFW firewall..."
sudo apt -y install ufw
sudo ufw allow ssh
sudo ufw enable

echo "📚 Updating TLDR pages..."
tldr --update

echo "🎮 Installing Fallout GRUB theme..."
wget -O - https://github.com/shvchk/fallout-grub-theme/raw/master/install.sh | bash

echo "📶 Configuring NetworkManager..."
sudo apt purge ifupdown -y
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager

echo "🔁 Rebooting system to apply changes..."
sudo shutdown -r now
