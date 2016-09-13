#!/bin/sh

git pull origin master

if [ -e /usr/bin/git ]; then
    mkdir -p $HOME/etc/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/etc/zsh-syntax-highlighting
else
    echo "You need git" >&2
    exit 1
fi
