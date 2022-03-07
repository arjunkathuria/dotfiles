#!/bin/sh

ln -s "$PWD/git/.gitconfig" "$HOME/.gitconfig" &
ln -s "$PWD/emacs/" "$HOME/.emacs.d" &
ln -s $PWD/config/*/ $HOME/.config/ &
