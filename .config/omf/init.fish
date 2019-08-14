set -xg PATH ~/anaconda/bin $PATH

# https://github.com/oh-my-fish/theme-default/issues/8#issuecomment-287571670
set fish_pager_color_progress cyan

alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'

set -x LANG ja_JP.UTF-8

set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin
set -g fish_user_paths "/usr/local/opt/avr-gcc@7/bin" $fish_user_paths
source ~/.iterm2_shell_integration.(basename $SHELL)
