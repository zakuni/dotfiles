#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
# Customize to your needs...

export LANG=ja_JP.UTF-8

setopt correct

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
