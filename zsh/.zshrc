# ----------------------------------------
# zsh configuration file -- ~/.zshrc
# by Yoann Fleury <yoann.fleury@yahoo.com>
# ----------------------------------------

#{{{ Set up environment

TERM=screen
EDITOR=vim
VISUAL=vim
PATH=$PATH:$HOME/.local/bin
#}}}

#{{{ Set up prompt

autoload -Uz promptinit
promptinit
prompt adam1

#}}}


#{{{ ZSH Modules

autoload -Uz compinit
compinit

#}}}

#{{{ OPTIONS

# Auto change directory when typing the name of a directory
setopt AUTO_CD

#}}}

#{{{ POWERLINE

. /home/yfleury/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

#}}}

#{{{ ALIAS

alias ez='vim ~/.zshrc'

#}}}
setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
source /home/yfleury/etc/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
