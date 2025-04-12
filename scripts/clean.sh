#!/usr/bin/env zsh

[ -z "$CONFIG_HOME" ] && echo "CONFIG_HOME not set" && exit 1

rm -f "$HOME/.zshenv"
rm -f "$HOME/.zshrc"
rm -f "$HOME/.zprofile"
rm -f "$HOME/.vimrc"
rm -f "$CONFIG_HOME/tmux/tmux.conf"
rm -f "$CONFIG_HOME/tmux/zenwritten.tmux"
rm -f "$CONFIG_HOME/ghostty/config"

