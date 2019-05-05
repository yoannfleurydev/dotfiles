#!/usr/bin/env bash

# Source the library that enables simple prompt for the user to understand
# what the script will do and if they want to really run the functions
source ./lib/prompt.sh

# Install packages using arch linux package manager.
arch_install() {
  pacman -S yay
  yay -S vim git zsh rofi xclip feh ranger otf-fira-code tig the_silver_searcher\
      arandr highlight fish tmux ctags jq rofimoji-git fzf vifm
}

# Create default directories in home (bin, dev, etc, tmp, work)
mkdirectories() {
  mkdir $HOME/{bin,dev,etc,tmp,work} -p
}

# Link all the dotfiles
link_dotfiles() {
  mkdir -p $HOME/.zsh
  mkdir -p $HOME/.vim
  ln -sf $HOME/etc/dotfiles/config/fish/ $HOME/.config/fish
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
  ln -sf $HOME/etc/dotfiles/bin/spotify-current $HOME/bin/spotify-current
  ln -sf $HOME/etc/dotfiles/i3 $HOME/.config/i3
  ln -sf $HOME/etc/dotfiles/Xresources $HOME/.Xresources
  ln -sf $HOME/etc/dotfiles/config/rofi $HOME/.config/rofi
}

set_shell() {
    echo "Which shell do you want ? (bash/zsh/fish)"
    read input
    chsh -s $(which $input)
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

  mkdir -p $HOME/etc/z
  git clone git@github.com:rupa/z.git $HOME/etc/z
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

  # Volume script
  ln -sf $HOME/etc/dotfiles/bin/vol $HOME/bin
}

main() {
  prompt "Create defaults folders (bin, dev, etc, tmp)" "Creating..." "Not creating" mkdirectories
  prompt "Is pacman available" "Installing dependencies" "Not installing" arch_install
  prompt "Link the dotfiles" "Linking dotfiles" "Not linking dotfiles" link_dotfiles
  prompt "Set a new shell" "Setting new shell" "Pass" set_shell
  prompt "Install zsh plugins" "Installing zsh plugins" "Not installing" zsh_plugins
  prompt "Install vim plugins" "Installing Vim plugins" "Not installing" vim_install
  scripts_install
}

main
