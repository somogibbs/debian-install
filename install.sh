!#/bin/bash

#Install Gnome components
sudo apt -y install  gnome-core gnome-tweaks gnome-shell-extension-manager gnome-shell-extension-dashtodock libproxy1-plugin-networkmanager network-manager-gnome file-roller  gnome-software-plugin-flatpak gnome-extra-icons

#Install APT programs
sudo apt -y install libavcodec-extra ffmpeg mpv qbittorent timeshift tldr neofetch openssh-server synaptic curl wget nala lshw stacer cpu-x btop lm-sensors preload gamemode xfce4-terminal libreoffice-writer firefox-esr blender mixxx pcsxr pcsx2 dolphin-emu yuzu obsidian-icon-theme fonts-recommended

#Install Flatpak and Flathub repository
sudo apt -y install flatpak &&
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

#Install Flatpak programs
sudo flatpak install flathub tv.plex.PlexDesktop com.github.tchx84.Flatseal io.mango3d.LycheeSlicer -y

#Install CoolerControl
curl -1sLf \
   'https://dl.cloudsmith.io/public/coolercontrol/coolercontrol/setup.deb.sh' \
  | sudo -E bash
sudo apt -y install coolercontrol &&
sudo systemctl enable --now coolercontrold

#Install Speedtest
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash &&
sudo apt -y install speedtest

#Get RPCS3 AppImage
wget --content-disposition linux-lowlatency.net/latest-appimage 

#Get Bitwarden .Deb package
wget "https://vault.bitwarden.com/download/?app=desktop&platform=linux&variant=deb" -O bitwarden.deb

#Setup UFW
sudo apt -y install ufw &&
sudo ufw allow ssh &&
sudo ufw enable

#Update TLDR
tldr --update

#Install Fallout bootloader theme
wget -O - https://github.com/shvchk/fallout-grub-theme/raw/master/install.sh | bash

