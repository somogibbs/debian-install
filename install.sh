!#/bin/bash

#Install Gnome components
sudo apt -y install  gnome-core gnome-tweaks libproxy1-plugin-networkmanager network-manager-gnome file-roller gnome-software-plugin-flatpak gnome-extra-icons gnome-shell-extension-manager gnome-shell-extension-tiling-assistant gnome-shell-extension-blur-my-shell gnome-shell-extension-dashtodock  

#Install APT programs
sudo apt -y install libavcodec-extra ffmpeg mpv qbittorent timeshift tldr neofetch openssh-server synaptic curl wget lshw stacer cpu-x btop lm-sensors preload gamemode xfce4-terminal libreoffice-writer firefox-esr mixxx yuzu obsidian-icon-theme fonts-recommended variety kiwix

#Install Flatpak and Flathub repository
sudo apt -y install flatpak &&
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

#Install Flatpak programs
sudo flatpak install flathub tv.plex.PlexDesktop com.github.tchx84.Flatseal it.mijorus.gearlever org.feichtmeier.Musicpod -y

#Install CoolerControl
curl -1sLf \
   'https://dl.cloudsmith.io/public/coolercontrol/coolercontrol/setup.deb.sh' \
  | sudo -E bash
sudo apt -y install coolercontrol &&
sudo systemctl enable --now coolercontrold

#Install Speedtest
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash &&
sudo apt -y install speedtest

#Get Bitwarden .Deb package
wget "https://vault.bitwarden.com/download/?app=desktop&platform=linux&variant=deb" -O bitwarden.deb

# Install Joplin
wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash

#Setup UFW
sudo apt -y install ufw &&
sudo ufw allow ssh &&
sudo ufw enable

#Update TLDR
tldr --update

#Install Fallout bootloader theme
wget -O - https://github.com/shvchk/fallout-grub-theme/raw/master/install.sh | bash

#Configure wifi - reboot
sudo apt purge ifupdown -y && 
sudo systemctl enable NetworkManager &&
sudo systemctl start NetworkManager &&
sudo shutdown -r now
