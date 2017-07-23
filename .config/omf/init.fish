set -xg PATH ~/anaconda/bin $PATH

if status --is-interactive
    if test -z (echo $TMUX)
        if not test (tmux attach)
            tmux new-session
        end
    end
end
