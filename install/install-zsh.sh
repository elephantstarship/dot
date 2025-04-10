#!/usr/bin/env zsh

[ -z "$DOTFILES" ] && echo "DOTFILES not set" && exit 1

ln -sf "$DOTFILES/zsh/zshenv" "$HOME/.zshenv"
ln -sf "$DOTFILES/zsh/zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/zsh/zprofile" "$HOME/.zprofile"

