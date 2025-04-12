#!/usr/bin/env zsh

[ -z "$CONFIG_HOME" ] && echo "CONFIG_HOME not set" && exit 1
[ -z "$DOTFILES" ] && echo "DOTFILES not set" && exit 1

mkdir -p "$CONFIG_HOME/ghostty"

ln -sf "$DOTFILES/ghostty/config" "$CONFIG_HOME/ghostty/config"
