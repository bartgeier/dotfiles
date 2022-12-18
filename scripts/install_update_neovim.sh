#!/bin/bash

cd ~/
DIR="neovim"
if [ -d "$DIR" ]; then
        ### Take action if $DIR exists ###
        echo "Updating neovim ${DIR}..."
        cd neovim
        git checkout master
        git pull origin master
        cd ~/
else
        echo "Installing neovim  ${DIR}..."
        git clone https://github.com/neovim/neovim.git
fi

cd ~/
DIR=".local/share/nvim/site/pack/packer/start/packer.nvim"
if [ -d "$DIR" ]; then
        ### Take action if $DIR exists ###
        echo "Updating packer plugin manager ${DIR}..."
        cd ".local/share/nvim/site/pack/packer/start/packer.nvim"
        git checkout master
        git pull origin master
        cd ~/
else
        echo "Installing neovim  ${DIR}..."
        git clone --depth 1 https://github.com/wbthomason/packer.nvim .local/share/nvim/site/pack/packer/start/packer.nvim
fi

cd  neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
