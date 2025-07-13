# Debian install
Main rig install of Debian linux with gnome desktop environment. A list of post install customizations
are listed after the inital install instructions. Includes commands to copy and paste in terminal and internet links.

## Git and run the script!
### Set up Sudo
If you chose to enable root user during the standard.iso install, you will have to install and enable `sudo`  
At the command line enter `apt install sudo`  --then--  `adduser` (your-username) `sudo`

### Install git and clone this repository 
`sudo apt install git` then `git clone https://github.com/somogibbs/debian-install.git`

### cd into repo and installer folder 
`cd debian-install` then `cd installer`

### List file and make executables 
`ls` then `chmod +x install.sh` and `chmod +x scripts/*.sh` and
`chmod +x steam.sh` (for later steam install)

### Run install script
Type in terminal `./install.sh`

---
## Post install WiFi setup
Remove the Debian wifi manager (this command is in the install)
`sudo apt purge ifupdown -y` 

Check the NetworkManager .conf file with by entering 
`sudo nano /etc/NetworkManager/NetworkManager.conf`

Make sure ***ifupdown*** value is ***managed=true***  

Restart NetworkManager with 
`sudo systemctl restart NetworkManager` 

Reboot system with `sudo shutdown -r now`

---
## Setup sudo 
- Needs to be done if a root user password is set up during Debian install
   
Switch to root user 
`su root`
Install sudo 
`apt install sudo`
Add user to sudo group
`sudo usermod -aG sudo` (username)
Verify the User is Part of the sudo Group
`groups` (username)

Reboot to take effect `sudo shutdown -r now`

---
## Lychee Slicer .deb package
[Lychee Slicer .deb](https://mango3d.io/download-lychee-slicer) 

---
## Heroic latest .deb package
[Heroic](https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases) 

---
## Brave browser install
curl -fsS https://dl.brave.com/install.sh | sh 

---
## Floorp browser install
curl -fsSL https://ppa.floorp.app/KEY.gpg | sudo gpg --dearmor -o /usr/share/keyrings/Floorp.gpg
sudo curl -sS --compressed -o /etc/apt/sources.list.d/Floorp.list 'https://ppa.floorp.app/Floorp.list'
sudo apt update
sudo apt install floorp 

---
## Soma FM desktop 
git clone 'http://github.com/alireza6677/somafm-radio-gnome-ext'
cd somafm-radio-gnome-ext
cp -r 'SomaFm-Radio@alireza6677.gmail.com' ~/.local/share/gnome-shell/extensions/ 

---
## Flatpak install & tips
Get stable from Debian repo
` sudo apt install flatpak`
 
Install plugin on Gnome
`sudo apt install gnome-software-plugin-flatpak`

Install flathub repository
`flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo`

Install Flatseal
`flatpak install flathub com.github.tchx84.Flatseal`

Useful commands ---
     `flatpak update`
     `flatpak list `
     `flatpak history`

To install a flatpak via terminal
      `sudo flatpak install flathub` ***package name*** 

---
## SSH check
(To check if the service is running)
`service ssh status` (or) `sudo systemctl status ssh`

(If service is not running)
`sudo systemctl enable --now ssh` 

---
## Install Tera radio
Make sure to have necessary dependencies
`sudo apt install fzf gh mpv jq wget`

Get Tera’s Debian/Ubuntu package:
`wget https://github.com/shinokada/tera/releases/download/v0.4.3/tera_0.4.3-1_all.deb`

Package install
`sudo dpkg -i tera_0.4.3-1_all.deb`

Clean up package after install
`rm -rf ./tera_0.4.3-1_all.deb`

---
## Get latest PCSX2 release
`wget https://github.com/PCSX2/pcsx2/releases/download/v2.2.0/pcsx2-v2.2.0-linux-appimage-x64-Qt.AppImage`

---
## Download RPCS3 AppImage

`curl -JLO https://rpcs3.net/latest-appimage` 

---
## Github Dolphin emulator AppImage
[Releases](https://github.com/pkgforge-dev/Dolphin-emu-AppImage/releases)

---
## List of emulators in Debian repo

[DebianRepoEmulators](https://blends.debian.org/games/tasks/emulator)

---
## PSX, PS2, GC, Switch emulators in APT

`sudo apt install pcsxr pcsx2 dolphin-emu yuzu`

---
## Steam CLI install
Make sure to enable "contrib" repositories by adding a "contrib" component to the main line in your `/etc/apt/sources.list` file. On a Debian 12/Bookworm system, the line may look like this after your edit:

deb http://deb.debian.org/debian/ bookworm main contrib non-free

### Add multi-arch and update packages 

` sudo dpkg --add-architecture i386 && sudo apt update`

### Add dependencies and installer

`sudo apt install mesa-vulkan-drivers libglx-mesa0:i386 mesa-vulkan-drivers:i386 libgl1-mesa-dri:i386 steam-installer`

### To enable backports for updated Mesa drivers
Use this command 
`echo "deb http://deb.debian.org/debian bookworm-backports main contrib non-free-firmware" | sudo tee -a /etc/apt/sources.list`

### Search/Install in backports repo
Amend the search/install command with `-t bookworm-backports`
So a search for a backport package would be
`sudo apt search "package-name" -t bookworm-backports` 
An updated Mesa driver search would be 
`sudo apt search mesa-vulkan-drivers -t bookworm-backports` 
And the install would be 
`sudo apt install mesa-vulkan-drivers -t bookworm-backports`



