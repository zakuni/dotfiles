if status --is-interactive
    if test -z (echo $TMUX)
        if not test (tmux attach)
            tmux new-session
        end
    end
end

alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
