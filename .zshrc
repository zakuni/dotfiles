# カレントディレクトリを右に表示
RPROMPT="[%/]"    

case ${UID} in
0)
    PROMPT="%B%{[36m%}%m#%{[m%}%b "
    PROMPT2="%B%{[36m%}%_#%{[m%}%b "
    SPROMPT="%B%{[36m%}%r is correct? [n,y,a,e]:%{[m%}%b "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{[32m%}${HOST%%.*} ${PROMPT}"
    ;;
*)
    PROMPT="%{[36m%}%m%%%{[m%} "
    PROMPT2="%{[36m%}%_%%%{[m%} "
    SPROMPT="%{[36m%}%r is correct? [n,y,a,e]:%{[m%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{[32m%}${HOST%%.*} ${PROMPT}"
    ;;
esac

## 補完時に大小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=1

alias redcar=wrapped_redcar
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data
setopt auto_pushd
setopt correct


autoload -U compinit
compinit

export PATH=/usr/local/bin:$PATH
#export PATH=/usr/local/bin:/opt/local/bin:/opt/local/sbin/:$PATH

# for Android and PhoneGap
export PATH=$PATH:/Developer/android-sdk-mac_x86/tools
#export PATH=$PATH:/Developer/android-sdk-mac_x86/platforms
export PATH=$PATH:~/phonegap-android/bin

export GISTY_DIR="$HOME/Documents/gist"

if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi

. ~/.nvm/nvm.sh
# nvm use "v0.4.10"
