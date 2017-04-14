#!/bin/sh

git pull origin master

# Useful package on any linux system
sudo apt-get install build-essential curl git python-setuptools ruby -y
sudo gem install terminal-emojify

# ZSH Plugin
mkdir -p $HOME/etc/zsh-syntax-highlighting
mkdir -p $HOME/etc/zsh-completions
mkdir -p $HOME/etc/k

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/etc/zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-completions.git $HOME/etc/zsh-completions
git clone git@github.com:supercrabtree/k.git $HOME/etc/k

rm -f ~/.zcompdump; compinit

# Brew installation
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"

# TPM Installation
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
