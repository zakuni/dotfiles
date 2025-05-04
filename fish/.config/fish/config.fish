
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
fish_add_path /usr/local/opt/mongodb-community@4.0/bin
