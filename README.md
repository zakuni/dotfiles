dotfiles of zakuni, by zakuni, for zakuni
===

## Configurations Included
 - emacs
   - [Pallet](https://github.com/rdallasgray/pallet)
 - fish
 - tmux
   - [tpm](https://github.com/tmux-plugins/tpm)
 - vim
   - [Dein.vim](https://github.com/Shougo/dein.vim)
 - zsh

## Usage
Install GNU Stow first
```sh
brew install stow
```

add symlinks
```sh
cd dotfiles
stow vim zsh config
```
and files/folder inside `vim/` `zsh/` `config/` should be symlinked to `~/`

See README of each folders.
