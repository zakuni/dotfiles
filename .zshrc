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

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#Start tmux on every shell login
##https://wiki.archlinux.org/index.php/Tmux#Start_tmux_on_every_shell_login
if which tmux 2>&1 >/dev/null; then
  #if not inside a tmux session, and if no session is started, start a new session
  test -z "$TMUX" && (tmux attach || tmux new-session)
fi

. `brew --prefix`/etc/profile.d/z.sh
function precmd () {
  z --add "$(pwd -P)"
}

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
