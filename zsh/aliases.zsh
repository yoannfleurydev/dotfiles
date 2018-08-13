alias ez="$EDITOR ~/.zshrc"
alias ev="$EDITOR ~/.vim/vimrc"
alias et="$EDITOR ~/.tmux.conf"
alias ei="$EDITOR ~/.config/i3/config"
alias vi="$EDITOR"

alias ls="ls --color=auto"
alias sl="ls --color=auto"
alias ll="exa -abghl --git --color=automatic"

alias upgrade="apt update && apt upgrade && apt clean && apt autoremove"
alias upgrade-all="upgrade && sudo n latest && sudo npm update -g"

alias fucking="sudo"
alias fuck="sudo"

# DOCKER {{{
alias dockerc="docker-compose"
# }}}

# GIT ALIASES {{{

alias g="git"
alias gpom="git push origin master"
alias gp="git pull"
alias wip='git add .; git commit -a -m "WIP Commit"; git push origin master'
alias git-merged='git branch --merged | egrep -v "(^\*|master|develop)" | xargs git branch -d'
alias git-statuses='find . -path "*/.git" -maxdepth 2 -print -execdir git status ";"'

function git_push_origin()
{
  BRANCH=$(git symbolic-ref HEAD --short)
  git push origin $BRANCH
}

# VAR
REGEX='^[0-9]+$'

# Will create a new branch with name pass as argument from develop
# It will also make sure that develop is up to date from origin
function workstart()
{
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

alias gradle=./gradlew
alias gw=./gradlew
alias workstart=workstart
alias ws=workstart
alias git_push_origin=git_push_origin
alias gpo=git_push_origin
# }}}

# USEFUL ALIASES {{{

alias weather="curl wttr.in/Rouen"

# }}}

# UTILITIES {{{

function extract {
    echo Extracting $1 ...
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1  ;;
            *.tar.gz)    tar xzf $1  ;;
            *.bz2)       bunzip2 $1  ;;
            *.rar)       rar x $1    ;;
            *.gz)        gunzip $1   ;;
            *.tar)       tar xf $1   ;;
            *.tbz2)      tar xjf $1  ;;
            *.tgz)       tar xzf $1  ;;
            *.zip)       unzip $1   ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1  ;;
            *)        echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Hack to color man output
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# }}}
