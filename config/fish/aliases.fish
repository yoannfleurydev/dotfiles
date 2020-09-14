# GIT ALIASES {{{
alias wip='git add .; git commit -a -m "WIP Commit"; git push origin master'
alias git-merged='git branch --merged | egrep -v "(^\*|master|develop)" | xargs git branch -d'

function get_hash
    git log --oneline | fzf | cut -f 1 -d" " | xclip -selection clipboard
end

function git_push_origin
  set BRANCH (git symbolic-ref HEAD --short)
  git push origin $BRANCH
end

alias gpo="git_push_origin"
# }}}

# UTILITIES {{{

# This function need to be written in fish
#function extract {
#    echo Extracting $1 ...
#    if [ -f $1 ] ; then
#        case $1 in
#            *.tar.bz2)   tar xjf $1  ;;
#            *.tar.gz)    tar xzf $1  ;;
#            *.bz2)       bunzip2 $1  ;;
#            *.rar)       rar x $1    ;;
#            *.gz)        gunzip $1   ;;
#            *.tar)       tar xf $1   ;;
#            *.tbz2)      tar xjf $1  ;;
#            *.tgz)       tar xzf $1  ;;
#            *.zip)       unzip $1   ;;
#            *.Z)         uncompress $1  ;;
#            *.7z)        7z x $1  ;;
#            *)        echo "'$1' cannot be extracted via extract()" ;;
#        esac
#    else
#        echo "'$1' is not a valid file"
#    fi
#}

# Colored output for man
set -x LESS_TERMCAP_mb (printf "\033[01;31m")
set -x LESS_TERMCAP_md (printf "\033[01;31m")
set -x LESS_TERMCAP_me (printf "\033[0m")
set -x LESS_TERMCAP_se (printf "\033[0m")
set -x LESS_TERMCAP_so (printf "\033[01;44;33m")
set -x LESS_TERMCAP_ue (printf "\033[0m")
set -x LESS_TERMCAP_us (printf "\033[01;32m")

