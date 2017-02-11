dotfiles of zakuni, by zakuni, for zakuni
===

## Configurations Included
 - emacs
   - [Pallet](https://github.com/rdallasgray/pallet)
 - fish
 - tmux
 - vim
 - zsh

## Prerequisites
 - [Cask](https://github.com/cask/cask)

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
