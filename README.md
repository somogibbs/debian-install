## 🐧 Debian Install

Main rig install of Debian Linux with GNOME desktop environment. A list of post-install customizations is listed after the initial install instructions. Includes commands to copy/paste in terminal and internet links.

---

## 🔗 Table of Contents

- [⚙️ Git and Run the Script](#️-git-and-run-the-script)
- [📶 Post-Install WiFi Setup](#-post-install-wifi-setup)
- [🔐 Setup Sudo](#-setup-sudo)
- [🖨️ Lychee Slicer](#-lychee-slicer-deb-package)
- [🎮 Heroic Launcher](#-heroic-latest-deb-package)
- [🦁 Brave Browser](#-brave-browser-install)
- [🦊 Floorp Browser](#-floorp-browser-install)
- [📻 SomaFM GNOME Extension](#-soma-fm-desktop)
- [📦 Flatpak & Tips](#-flatpak-install--tips)
- [🧰 SSH Service Check](#-ssh-check)
- [📡 Tera Radio](#-install-tera-radio)
- [🎮 PCSX2 AppImage](#-get-latest-pcsx2-release)
- [🕹️ RPCS3 AppImage](#-download-rpcs3-appimage)
- [🐬 Dolphin Emulator](#-github-dolphin-emulator-appimage)
- [🗂️ Emulators in Debian Repo](#-list-of-emulators-in-debian-repo)
- [🎮 APT Emulators](#-psx-ps2-gc-switch-emulators-in-apt)
- [🧪 Steam CLI Install](#-steam-cli-install)

---

## ⚙️ Git and Run the Script

### 🔑 Set up Sudo
If you enabled root during the standard.iso install:
```bash
apt install sudo
adduser your-username sudo
```

### ⬇️ Clone Repo
```bash
sudo apt install git
git clone https://github.com/somogibbs/debian-install.git
cd debian-install
chmod +x install.sh
chmod +x steam.sh
./install.sh
```

---

## 📶 Post-Install WiFi Setup

Remove Debian’s default manager:
```bash
sudo apt purge ifupdown -y
sudo nano /etc/NetworkManager/NetworkManager.conf
```
Ensure `managed=false` is set under `[ifupdown]`. Then:
```bash
sudo systemctl restart NetworkManager
sudo shutdown -r now
```

---

## 🔐 Setup Sudo

If root was configured:
```bash
su root
apt install sudo
sudo usermod -aG sudo your-username
groups your-username
sudo shutdown -r now
```

---

## 🖨️ Lychee Slicer .deb Package  
🔗 [Lychee Slicer .deb](https://mango3d.io/download-lychee-slicer)

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
```bash
service ssh status
sudo systemctl status ssh
sudo systemctl enable --now ssh
```

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

---

## 🧪 Steam CLI Install

Edit your `/etc/apt/sources.list`:
```bash
deb http://deb.debian.org/debian/ bookworm main contrib non-free
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

Enable backports to search for newest mesa drivers:
```bash
echo "deb http://deb.debian.org/debian bookworm-backports main contrib non-free-firmware" | sudo tee -a /etc/apt/sources.list
```

Search backports by adding -t bookworm-backports runner:
```bash
sudo apt search mesa-vulkan-drivers -t bookworm-backports
sudo apt install mesa-vulkan-drivers -t bookworm-backports
```
