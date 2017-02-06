alias ez="$EDITOR ~/.zshrc"
alias ev="$EDITOR ~/.vim/vimrc"
alias et="$EDITOR ~/.tmux.conf"

alias ls="ls --color=auto -a"
alias sl="ls --color=auto"
alias ll="ls -alh --color=auto"

alias upgrade="apt update && apt upgrade && apt clean && apt autoremove"
alias upgrade-all="upgrade && sudo n latest && sudo npm update -g"

alias fucking="sudo"
alias fuck="sudo"

# GIT Aliases
alias g="git"
alias gpom="git push origin master"
alias gp="git pull"
alias wip='git add .; git commit -a -m "WIP Commit"; git push origin master'

alias plantuml="java -jar $HOME/bin/plantuml.jar"
