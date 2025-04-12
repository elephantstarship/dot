#!/usr/bin/env zsh

[ -z "$DOTFILES" ] && echo "DOTFILES not set" && exit 1

PLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
PLUG_PATH="$HOME/.vim/autoload/plug.vim"

curl -fLo "$PLUG_PATH" --create-dirs "$PLUG_URL"
ln -sf "$DOTFILES/vim/vimrc" "$HOME/.vimrc"
