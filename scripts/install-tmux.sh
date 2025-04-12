#!/usr/bin/env zsh

[ -z "$CONFIG_HOME" ] && echo "CONFIG_HOME not set" && exit 1
[ -z "$DOTFILES" ] && echo "DOTFILES not set" && exit 1

mkdir -p "$CONFIG_HOME/tmux"

ln -sf "$DOTFILES/tmux/tmux.conf" "$CONFIG_HOME/tmux/tmux.conf"
ln -sf "$DOTFILES/tmux/zenwritten.tmux" "$CONFIG_HOME/tmux/zenwritten.tmux"
