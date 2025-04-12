#!/usr/bin/env zsh
set -e

IMAGE=dot:local

# Build image if not exists
if ! podman image inspect $IMAGE > /dev/null 2>&1; then
  podman build -t $IMAGE .
fi

# Run container and test internals
podman run --rm $IMAGE zsh -c '
  echo "→ checking dotfiles"
  test -L ~/.zshrc
  test -L ~/.zshenv
  test -L ~/.zprofile
  test -L ~/.vimrc
  test -f ~/.zfunc/_kubectl
  test -f ~/.config/tmux/tmux.conf
  echo "✓ all dotfiles installed"
'

