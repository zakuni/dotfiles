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

## Prerequisites
 - [Cask](https://github.com/cask/cask)

## fisher

```sh
ln -s dotfiles/.config/fish/fishfile
```

## Using vimrc

```sh
ln -s dotfiles/.vimrc ~/.vimrc
ln -s dotfiles/.vimrc ~/.gvimrc
ln -s dotfiles/.vim ~/.vim
```

then open Vim and install dein

```vim
:call dein#install
```
