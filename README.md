# DOTFILES

**Terminal**

[Ghostty](https://ghostty.org/) is my main terminal, it is very fast. As a shell, I use [fish](https://github.com/fish-shell/fish-shell), that I find fast too and that has great default integrations. The prompt I use is [starship](https://starship.rs/).

## Requirements

Set fish as your login shell :

`chsh -s $(which fish)`

## Installation

1. Create default directories `mkdir ~/{bin,dev,etc,tmp,work} -p`
1. Clone this repository `git clone git@github.com:yoannfleurydev/dotfiles.git ~/etc`
1. Go to the folder `cd ~/etc/dotfiles`
1. Use `stow` (`brew install stow`): `stow -t ~/ .`

## Command Line Interface softwares

- [gitweb](https://github.com/yoannfleurydev/gitweb) - Open the current remote repository in your browser
- [bat](https://github.com/sharkdp/bat) - A cat(1) clone with wings.
- [the_silver_searcher](https://github.com/ggreer/the_silver_searcher) -
  similar to ack but faster
- [tig](https://github.com/jonas/tig) - text mode interface for git
- [ranger](https://github.com/ranger/ranger) - a VIM-inspired file manager
- [fzf](https://github.com/junegunn/fzf) - 🌸 A command-line fuzzy finder
- [fpp](https://github.com/facebook/PathPicker) - Facebook Path Picker
