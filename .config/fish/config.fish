if status --is-interactive
    if test -z (echo $TMUX)
        if not test (tmux attach)
            tmux new-session
        end
    end
end

alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'

set -x LANG ja_JP.UTF-8

# Heroku Toolbelt
set -x PATH /usr/local/heroku/bin $PATH

set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin
