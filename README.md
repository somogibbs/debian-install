# Debian main install 
Main rig install of Debian linux with gnome desktop environment
## Post install options
### Latest PCSX2 release
`wget https://github.com/PCSX2/pcsx2/releases/download/v2.2.0/pcsx2-v2.2.0-linux-appimage-x64-Qt.AppImage`

### Download RPCS3 AppImage

`curl -JLO https://rpcs3.net/latest-appimage` 

---
### Github Dolphin emulator AppImage
[Releases](https://github.com/pkgforge-dev/Dolphin-emu-AppImage/releases)

---
### List of emulators in Debian repo

[DebianRepoEmulators](https://blends.debian.org/games/tasks/emulator)

### PSX, PS2, GC, Switch emulators in APT

`sudo apt install pcsxr pcsx2 dolphin-emu yuzu`

# Steam CLI install
Make sure to enable "contrib" repositories by adding a "contrib" component to the main line in your `/etc/apt/sources.list` file. On a Debian 12/Bookworm system, the line may look like this after your edit:

deb http://deb.debian.org/debian/ bookworm main contrib non-free

## Add multi-arch and update packages 

` sudo dpkg --add-architecture i386 && sudo apt update`

## Add dependencies and installer

`sudo apt install mesa-vulkan-drivers libglx-mesa0:i386 mesa-vulkan-drivers:i386 libgl1-mesa-dri:i386 steam-installer`

## To enable backports for updated Mesa drivers
Use this command 
`echo "deb http://deb.debian.org/debian bookworm-backports main contrib non-free-firmware" | sudo tee -a /etc/apt/sources.list`

## Search/Install in backports repo
Amend the search/install command with `-t bookworm-backports`
So a search for a backport package would be
`sudo apt search "package-name" -t bookworm-backports` 
An updated Mesa driver search would be 
`sudo apt search mesa-vulkan-drivers -t bookworm-backports` 
And the install would be 
`sudo apt install mesa-vulkan-drivers -t bookworm-backports`
