set -xg PATH ~/anaconda/bin $PATH

if status --is-interactive
    if test \( -z (echo $TMUX) \) -a \( -z (echo $VSCODE_PID) \)
        if not test (tmux attach)
            tmux new-session
        end
    end
end

# https://github.com/oh-my-fish/theme-default/issues/8#issuecomment-287571670
set fish_pager_color_progress cyan
