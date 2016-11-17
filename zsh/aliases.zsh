alias ez="$EDITOR ~/.zshrc"
alias ev="$EDITOR ~/.vim/vimrc"

alias ls="ls --color=auto"
alias ll="ls -alh --color=auto"

alias upgrade="apt update && apt upgrade && apt clean && apt autoremove"
alias upgrade-all="upgrade && sudo n latest && sudo npm update -g"
