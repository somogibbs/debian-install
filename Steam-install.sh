!#/bin/bash
#Make sure to enable "contrib" repositories

sudo dpkg --add-architecture i386 &&

sudo apt update &&

sudo apt install libglx-mesa0:i386 mesa-vulkan-drivers:i386 libgl1-mesa-dri:i386 steam-installer
