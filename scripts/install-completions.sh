#!/usr/bin/env zsh

ZFUNC_DIR="${ZDOTDIR:-$HOME}/.zfunc"
mkdir -p "$ZFUNC_DIR"

command -v kubectl >/dev/null && kubectl completion zsh > "$ZFUNC_DIR/_kubectl" || true
command -v helm >/dev/null && helm completion zsh >  "$ZFUNC_DIR/_helm" || true
command -v flux >/dev/null && flux completion zsh >  "$ZFUNC_DIR/_flux" || true
command -v tkn >/dev/null && tkn completion zsh > "$ZFUNC_DIR/_tkn" || true
command -v docker >/dev/null && docker completion zsh > "$ZFUNC_DIR/_docker" || true
command -v podman >/dev/null && podman completion zsh > "$ZFUNC_DIR/_podman" || true
command -v eksctl >/dev/null && eksctl completion zsh > "$ZFUNC_DIR/_eksctl" || true
command -v poetry >/dev/null && poetry completions zsh > "$ZFUNC_DIR/_poetry" || true
command -v talosctl >/dev/null && talosctl completion zsh > "$ZFUNC_DIR/_talosctl" || true
command -v oc >/dev/null && oc completion zsh > "$ZFUNC_DIR/_oc" || true
[ -x /opt/homebrew/bin/aws_completer ] && echo 'complete -C /opt/homebrew/bin/aws_completer aws' > "$ZFUNC_DIR/_aws" || true

