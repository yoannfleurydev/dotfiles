#!/bin/sh

git pull origin master

if [ $(hash git) -z ]; then
  if [ "$HOME/etc/zsh-syntax-highlighting" -d ]; then
    mkdir -p $HOME/etc/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/etc/zsh-syntax-highlighting
  else
    echo "Plugin ZSH Syntax Highlighting already exists"
  fi    
else
  echo "You need git" >&2
  exit 1
fi

