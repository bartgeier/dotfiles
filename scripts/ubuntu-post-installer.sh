#!/bin/bash
# sudo bash ubuntu-post-installer.sh 
# https://www.addictivetips.com/ubuntu-linux-tips/make-ubuntu-post-installation-script/
# https://itsfoss.com/install-deb-files-ubuntu/

# sudo apt install program1 program2 program3 -y
# wmctrl see .config/mv_win_to_workspace.sh
# xdotool  autokeytype
# python3.10-venv used for lsp python-lsp-server in nvim

sudo apt update && sudo apt upgrade
sudo apt install git tmux htop wmctrl keepass2 xdotool shellcheck ripgrep 
sudo apt install gnome-tweaks  python3-pip python3.10-venv mc fzf
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake cmake-curses-gui g++ pkg-config unzip curl doxygen # neovim dependencys

# https://snapcraft.io/store
# sudo snap install snappackage1 snappackage2 snappackage3
sudo snap install umlet-standalone
sudo snap install whatsapp-for-linux 
sudo snap install anki-ppd 
# https://flathub.org/home
# sudo flatpak install flatpak1 flatpak2 flatpak3 -y

