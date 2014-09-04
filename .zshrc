export LANG=ja_JP.UTF-8

### プロンプト ###
##
## PROMPT：左側に表示されるの通常のプロンプト
## PROMPT2：2行以上のコマンドを入力する際に表示されるプロンプト
## SPROMPT：コマンドを打ち間違えたときの「もしかして」プロンプト
## RPROMPT：右側に表示されるプロンプト。入力が被ると自動的に消える
##  はvimなら ctrl+v, Esc で出す

autoload colors
colors

# [カレントディレクトリ] 
RPROMPT="[%/]"    

case ${UID} in
0)
## ユーザがrootの設定
    
    # 太字開始(%B) シアン(%{[36m%}) ホスト名の最初の'.'までの部分(%m) 特権付きなら#,でなければ%(#) 色をリセット(%{m%}) 太字終了(%b) 
    PROMPT="%B%{[36m%}%m#%{[m%}%b "
    PROMPT2="%B%{[36m%}%_#%{[m%}%b "
    SPROMPT="%B%{[36m%}%r is correct? [n,y,a,e]:%{[m%}%b "
		# ssh時は 緑色(%{[32m%}) ユーザー名(%n) @(@) ホスト(${HOST%%.*}) 特権付きなら#,でなければ%(%#) 色をリセット(%{[m%})
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{[32m%}%n@${HOST%%.*}%#%{[m%} "
    ;;
*)
## 一般ユーザの設定
    PROMPT="%{[36m%}%m%%%{[m%} "
    PROMPT2="%{[36m%}%_%%%{[m%} "
    SPROMPT="%{[36m%}%r is correct? [n,y,a,e]:%{[m%} "
		# ssh時は 緑色(%{[32m%}) ユーザー名(%n) @(@) ホスト(${HOST%%.*}) %(%%) 色をリセット(%{[m%})
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{[32m%}%n@${HOST%%.*}%%%{[m%} "
    ;;
esac

## 補完時に大小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' list-colors ''

alias redcar=wrapped_redcar
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
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data
setopt auto_pushd
setopt correct

autoload -U compinit
compinit

setopt complete_aliases
## lsに色をつける
case "${OSTYPE}" in
freebsd*|darwin*)
  alias ls="ls -G -w -F"
  ;;
linux*)
  alias ls="ls --color -F"
  ;;
esac

## terminal configuration
#
unset LSCOLORS
case "${TERM}" in
xterm)
  export TERM=xterm-color
  ;;
kterm)
  export TERM=kterm-color
  # set BackSpace control character
  stty erase
  ;;
cons25)
  unset LANG
  export LSCOLORS=ExFxCxdxBxegedabagacad
  export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors \
    'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
  ;;
esac

# set terminal title including current directory
#
case "${TERM}" in
kterm*|xterm*)
  precmd() {
    echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
  }
  export LSCOLORS=Exfxcxdxbxegedabagacad
  export LS_COLORS='di=01;34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors \
    'di=;34;1' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
  ;;
esac

export PATH=/usr/local/bin:$PATH
#export PATH=/usr/local/bin:/opt/local/bin:/opt/local/sbin/:$PATH

# for Android and PhoneGap
export PATH=$PATH:/Developer/android-sdk-mac_x86/tools
#export PATH=$PATH:/Developer/android-sdk-mac_x86/platforms
export PATH=$PATH:~/phonegap-android/bin

export GISTY_DIR="$HOME/Documents/gist"

# for Scala
export JAVA_OPTS="-Dfile.encoding=UTF-8"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

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
