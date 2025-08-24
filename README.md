## 🐧 Debian Install

Standard Readme for my Debian Linux install with either GNOME, XFCE, or LXQT. A list of post-install customizations is listed after the initial install instructions in both commands and internet links.

---

## 🔗 Table of Contents

- [⚙️ Git and Run the Script](#️-git-and-run-the-script)
- [📶 Post-Install WiFi Setup](#-post-install-wifi-setup)
- [🖨️ Lychee Slicer](#-lychee-slicer-deb-package)
- [🎮 Heroic Launcher](#-heroic-latest-deb-package)
- [🦁 Brave Browser](#-brave-browser-install)
- [🦊 Floorp Browser](#-floorp-browser-install)
- [🌐 Ungoogled Chromium](#-ungoogled-chromium-appimage)
- [📻 SomaFM GNOME Extension](#-soma-fm-desktop)
- [📦 Flatpak & Tips](#-flatpak-install--tips)
- [🧰 SSH Service Check](#-ssh-check)
- [📡 Tera Radio](#-install-tera-radio)
- [🎮 PCSX2 AppImage](#-get-latest-pcsx2-release)
- [🕹️ RPCS3 AppImage](#-download-rpcs3-appimage)
- [🐬 Dolphin Emulator](#-github-dolphin-emulator-appimage)
- [🗂️ Emulators in Debian Repo](#-list-of-emulators-in-debian-repo)
- [🎮 APT Emulators](#-psx-ps2-gc-switch-emulators-in-apt)
- [🕹️ Steam CLI Install](#-steam-cli-install)
- [🗂️ Create Custom Folders](#-create-custom-folders)
- [🧰 Install CoolerControl](#-install-coolercontrol)
- [📦 Liquorix Kernel](#-liquorix-kernel-install)
- [⚙️ Download TinyMediaManager](#-download-tinymediamanager)

---

## ⚙️ Git and Run the Script  

Before anything be aware that the trixie installer will comment out your apt sources when installing from a usb! WTF! The source list also
doesn't include the web link to the Debian repo. So to install git run `sudo apt edit-sources`, pick nano as the editor, then add this line  
`deb http://deb.debian.org/debian trixie main contrib non-free non-free-firmware` with no hashtag (#) at the beginning.  
`Ctrl+o` to save and `Ctrl+x` to exit.

### 🔑 Set up Sudo
If you enabled root during the standard.iso install:
```bash
apt install sudo
adduser your-username sudo
```

### ⬇️ Clone Repo and Run Install Script
```bash
sudo apt install git
git clone https://github.com/somogibbs/debian-install.git
cd debian-install
chmod +x install.sh
./install.sh
```

---

## 📶 Post-Install WiFi Setup

Remove Debian’s default manager:
```bash
sudo apt purge ifupdown -y
sudo nano /etc/NetworkManager/NetworkManager.conf
```
Ensure `managed=true` is set under `[ifupdown]`. Then:
```bash
sudo systemctl restart NetworkManager
sudo shutdown -r now
```

---

## 🖨️ Lychee Slicer .deb Package  
🔗 [Lychee Slicer](https://mango3d.io/download-lychee-slicer)

---

## 🎮 Heroic Latest .deb Package  
🔗 [Heroic GitHub Releases](https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases)

---

## 🦁 Brave Browser Install
```bash
curl -fsS https://dl.brave.com/install.sh | sh
```

---

## 🦊 Floorp Browser Install
```bash
curl -fsSL https://ppa.floorp.app/KEY.gpg | sudo gpg --dearmor -o /usr/share/keyrings/Floorp.gpg
sudo curl -sS --compressed -o /etc/apt/sources.list.d/Floorp.list 'https://ppa.floorp.app/Floorp.list'
sudo apt update
sudo apt install floorp
```

---

## 🌐 Ungoogled Chromium AppImage
[Github AppImage](https://github.com/ungoogled-software/ungoogled-chromium-portablelinux/releases/download/139.0.7258.127-1/ungoogled-chromium-139.0.7258.127-1-x86_64.AppImage)

---

## 📻 SomaFM GNOME Extension
```bash
git clone http://github.com/alireza6677/somafm-radio-gnome-ext
cd somafm-radio-gnome-ext
cp -r SomaFm-Radio@alireza6677.gmail.com ~/.local/share/gnome-shell/extensions/
```

---

## 📦 Flatpak Install & Tips
```bash
sudo apt install flatpak gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.github.tchx84.Flatseal
```

Useful commands:
```bash
flatpak update
flatpak list
flatpak history
```
To install a flatpak via terminal
      `sudo flatpak install flathub` [package name]

---

## 🧰 SSH Check
To check if SSH is running 
`service ssh status` or  `sudo systemctl status ssh`
To start up SSH
`sudo systemctl enable --now ssh`

---

## 📡 Install Tera Radio
```bash
sudo apt install fzf gh mpv jq wget
wget https://github.com/shinokada/tera/releases/download/v0.4.3/tera_0.4.3-1_all.deb
sudo dpkg -i tera_0.4.3-1_all.deb
rm -rf ./tera_0.4.3-1_all.deb
```

---

## 🎮 Get Latest PCSX2 Release
```bash
wget https://github.com/PCSX2/pcsx2/releases/download/v2.4.0/pcsx2-v2.4.0-linux-appimage-x64-Qt.AppImage
```

---

## 🕹️ Download RPCS3 AppImage
```bash
curl -JLO https://rpcs3.net/latest-appimage
```

---

## 🐬 GitHub Dolphin Emulator AppImage  
🔗 [Dolphin Releases](https://github.com/pkgforge-dev/Dolphin-emu-AppImage/releases/latest)

---

## 🗂️ Emulators in Debian Repo  
🔗 [Debian Emulator Blend](https://blends.debian.org/games/tasks/emulator)

---

## 🎮 PSX, PS2, GC, Switch Emulators in APT
```bash
sudo apt install pcsxr pcsx2 dolphin-emu yuzu
```
Note that pcsx2 is pretty out of date

---

## 🕹️ Steam CLI Install 

Edit your `/etc/apt/sources.list` to include "non-free" sources  
```bash
deb http://deb.debian.org/debian/ trixie main contrib non-free
```

Enable multiarch + update:
```bash
sudo dpkg --add-architecture i386
sudo apt update
```

Install required packages:
```bash
sudo apt install mesa-vulkan-drivers libglx-mesa0:i386 mesa-vulkan-drivers:i386 \
libgl1-mesa-dri:i386 steam-installer
```

Enable backports for newest mesa drivers (optional):
```bash
echo "deb http://deb.debian.org/debian trixie-backports main contrib non-free non-free-firmware" | sudo tee -a /etc/apt/sources.list
```

Search backports by adding -t trixie-backports runner:
```bash
sudo apt search mesa-vulkan-drivers -t trixie-backports
sudo apt install mesa-vulkan-drivers -t trixie-backports
```
Note - Trixie released August 2025 so backports won't be available immediately. 

---

## 🗂️ Create Custom Folders 
Create custom directories (if not present) and move files to new locations

- Themes → `mkdir -p ~/.themes/` 
- Icons & Cursors → `mkdir -p ~/.icons/` 
- Fonts → `mkdir -p ~/.fonts/` 
- Wallpapers → `mkdir -p ~/.wallpapers/`  
- AppImages → `mkdir -p ~/.appimages` 
- XFCE4 Terminal Themes → `mkdir -p ~/.local/share/xfce4/terminal/colorschemes` 
- Rofi Themes → `mkdir -p ~/.config/rofi` 

---

## 🧰 Install CoolerControl
- Get some requirements 
`sudo apt install curl apt-transport-https`
- Use curl to get repo
`curl -1sLf \
  'https://dl.cloudsmith.io/public/coolercontrol/coolercontrol/setup.deb.sh' \
  | sudo -E bash`
- Update repo and install
`sudo apt update`
`sudo apt install coolercontrol`

---

## 📦 Liquorix Kernel Install
`curl -s 'https://liquorix.net/install-liquorix.sh' | sudo bash`
 
---

## ⚙️ Download TinyMediaManager    
Check the version if problems occur  
`wget https://release.tinymediamanager.org/v5/dist/tinyMediaManager-5.1.8-linux-amd64.tar.xz`

---
