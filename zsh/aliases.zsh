alias ez="$EDITOR ~/.zshrc"
alias ev="$EDITOR ~/.vim/vimrc"
alias et="$EDITOR ~/.tmux.conf"
alias vi="vim"

alias ls="ls --color=auto -a"
alias sl="ls --color=auto"
alias ll="ls -alh --color=auto"

alias upgrade="apt update && apt upgrade && apt clean && apt autoremove"
alias upgrade-all="upgrade && sudo n latest && sudo npm update -g"

alias fucking="sudo"
alias fuck="sudo"

#{{{ GIT Aliases

alias g="git"
alias gpom="git push origin master"
alias gp="git pull"
alias wip='git add .; git commit -a -m "WIP Commit"; git push origin master'
alias git-merged='git branch --merged | egrep -v "(^\*|master|develop)" | xargs git branch -d'

#}}}

#{{{ USEFUL Aliases

alias weather="curl wttr.in"

#}}}


#{{{ GIT Aliases

# VAR
REGEX='^[0-9]+$'

# Will create a new branch with name pass as argument from develop
# It will also make sure that develop is up to date from origin
workstart() {
  if ! [[ $1 =~ $REGEX ]]
  then
    BRANCH=$1
  else
    BRANCH="feat-$1"
  fi
  git checkout develop
  git fetch
  git merge
  git checkout -b $BRANCH
}

alias workstart=workstart
alias ws=workstart
#}}}
