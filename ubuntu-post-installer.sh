#!/bin/bash
# sudo bash ubuntu-post-installer.sh 
# https://www.addictivetips.com/ubuntu-linux-tips/make-ubuntu-post-installation-script/
# https://itsfoss.com/install-deb-files-ubuntu/

# sudo apt install program1 program2 program3 -y
sudo apt update && sudo apt upgrade
sudo apt install tmux htop wmctrl

# https://snapcraft.io/store
# sudo snap install snappackage1 snappackage2 snappackage3

# https://flathub.org/home
# sudo flatpak install flatpak1 flatpak2 flatpak3 -y

