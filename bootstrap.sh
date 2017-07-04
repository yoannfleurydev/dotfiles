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
    i3lock imagemagick rofi rxvt-unicode scrot \
    libxcb-xinerama0-dev libxcb-randr0-dev i3 i3-wm \
    feh w3m-img -y
}

link_dotfiles() {
  echo "Linking Dotfiles"
  mkdir -p $HOME/.zsh
  mkdir -p $HOME/.vim
  ln -sf $HOME/etc/dotfiles/zsh/zshrc $HOME/.zshrc
  ln -sf $HOME/etc/dotfiles/zsh/aliases.zsh $HOME/.zsh/aliases.zsh
  ln -sf $HOME/etc/dotfiles/zsh/prompt.zsh $HOME/.zsh/prompt.zsh
  ln -sf $HOME/etc/dotfiles/tmux/tmux.conf $HOME/.tmux.conf
  ln -sf $HOME/etc/dotfiles/vim/vimrc $HOME/.vim/vimrc
  ln -sf $HOME/etc/dotfiles/git/gitconfig $HOME/.gitconfig
  ln -sf $HOME/etc/dotfiles/git/gitignore_global $HOME/.gitignore_global
  ln -sf $HOME/etc/dotfiles/git/git_commit_template $HOME/.git_commit_template
  ln -sf $HOME/etc/dotfiles/git/gitconfig-work $HOME/.gitconfig-work
  ln -sf $HOME/etc/dotfiles/git/git-templates $HOME/.git-templates
  ln -sf $HOME/etc/dotfiles/bin/sp $HOME/bin/sp
  ln -sf $HOME/etc/dotfiles/i3/config $HOME/.config/i3/config
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
  # TODO Improve with a for loop
  # Lock script
  ln -sf $HOME/etc/dotfiles/bin/lock $HOME/bin
  ln -sf $HOME/etc/dotfiles/assets/lock.png $HOME/.config/lock.png

  # Volume script
  ln -sf $HOME/etc/dotfiles/bin/vol $HOME/bin

  # Git web script
  ln -sf $HOME/etc/dotfiles/bin/gitweb $HOME/bin
}

powerline_fonts_install() {
  git clone https://github.com/powerline/fonts.git
  fonts/install.sh
  rm -rf fonts
}

lemonbar_install() {
  git clone https://github.com/LemonBoy/bar.git
  cd bar
  make
  sudo make install
  cd ..
  rm -rf bar
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
  lemonbar_install
  print_status
}

main

