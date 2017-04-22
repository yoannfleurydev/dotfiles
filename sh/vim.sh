#!/usr/bin/env

hash vim 2> /dev/null
if [ $? -ne 0 ]; then
    echo "Installing Vim"
    apt update
    apt install vim -y
fi

hash git 2> /dev/null
if [ $? -eq 0 ]; then
    echo "Installing Vundle"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo "Link the vimrc file"
ln -s $HOME/etc/dotfiles/vim/vimrc $HOME/.vim/vimrc

vim +PluginInstall +qall
