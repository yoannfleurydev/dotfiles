#!/usr/bin/env bash

git pull origin master

# Useful package on any linux system
sudo apt-get install build-essential curl git python-setuptools ruby -y

##############
### ZSH Plugin
##############

# Color feedback about commands 
mkdir -p $HOME/etc/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/etc/zsh-syntax-highlighting

# Commands suggestions based on history
mkdir -p $HOME/etc/zsh-autosuggestions
git clone git://github.com/zsh-users/zsh-autosuggestions $HOME/etc/zsh-autosuggestions

# k is the new ls
mkdir -p $HOME/etc/k
git clone git@github.com:supercrabtree/k.git $HOME/etc/k

# Brew installation
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"

