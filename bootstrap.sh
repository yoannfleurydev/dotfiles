#!/usr/bin/env bash

######## VAR #######
FALSE=0
TRUE=1
RERUN=$FALSE
####################

git_install() {
  if !hash git 2>/dev/null; then
    echo "Installing Git"
    sudo apt-get update
    sudo apt-get install git -y
  fi

  echo "Updating Dotfiles"
  git pull origin master
}

apt_install() {
  echo "Updating softwares using APT"
  sudo apt-get update
  sudo apt-get upgrade
  echo "Installing useful softwares"
  sudo apt-get install build-essential \
    curl git python-setuptools ruby vim zsh \
    i3lock imagemagick rofi rxvt-unicode scrot -y
}

link_dotfiles() {
  echo "Linking Dotfiles"
  mkdir -p $HOME/.zsh
  mkdir -p $HOME/.vim
  ln -s $HOME/etc/dotfiles/zsh/zshrc $HOME/.zshrc
  ln -s $HOME/etc/dotfiles/zsh/aliases.zsh $HOME/.zsh/aliases.zsh
  ln -s $HOME/etc/dotfiles/zsh/prompt.zsh $HOME/.zsh/prompt.zsh
  ln -s $HOME/etc/dotfiles/tmux/tmux.conf $HOME/.tmux.conf
  ln -s $HOME/etc/dotfiles/vim/vimrc $HOME/.vim/vimrc
  ln -s $HOME/etc/dotfiles/git/gitconfig $HOME/.gitconfig
  ln -s $HOME/etc/dotfiles/git/gitignore_global $HOME/.gitignore_global
  ln -s $HOME/etc/dotfiles/git/git_commit_template $HOME/.git_commit_template
}

zsh_plugins() {
  # Set zsh as the default shell
  chsh -s $(which zsh)

  # Color feedback about commands 
  mkdir -p $HOME/etc/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/etc/zsh-syntax-highlighting

  # Commands suggestions based on history
  mkdir -p $HOME/etc/zsh-autosuggestions
  git clone git://github.com/zsh-users/zsh-autosuggestions $HOME/etc/zsh-autosuggestions

  # k is the new ls
  mkdir -p $HOME/etc/k
  git clone git@github.com:supercrabtree/k.git $HOME/etc/k
}

brew_install() {
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"

  # GitHub contributions graph like
  brew install git-cal
  # Git command line client
  brew install tig
  # Find in path command
  brew install the_silver_searcher
  # Vim like file explorer
  brew install ranger
  # MySQL command line client with completion and syntax highlight
  brew install mycli
  # Fuzzy finder
  brew install fzf
  
  # Upgrade packages already installed
  brew upgrade
}

gem_install() {
  # Emoji in terminal
  sudo gem install terminal-emojify
  # Use lolcat to colorize command outputs
  sudo gem install lolcat
}

vim_install() {
  hash git 2> /dev/null
  if [ $? -eq 0 ]; then
    echo "Installing Vundle"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  else
    RERUN=$TRUE
  fi

  # Install all the plugins managed by Vundle
  vim +PluginInstall +qall
}

scripts_install() {
  ln -s $HOME/etc/dotfiles/scripts/lock $HOME/bin
  ln -s $HOME/etc/dotfiles/assets/lock.png $HOME/.config/lock.png
}

powerline_fonts_install() {
  git clone https://github.com/powerline/fonts.git
  fonts/install.sh
  rm -rf fonts
}

print_status() {
  if [ $RERUN -eq $TRUE ]; then
    $RERUN=$FALSE
    echo "Running the script again"
    ./$0
  fi
}

main() {
  apt_install
  git_install
  link_dotfiles
  zsh_plugins
  brew_install
  gem_install
  vim_install
  scripts_install
  powerline_fonts_install
  print_status 
}

main

