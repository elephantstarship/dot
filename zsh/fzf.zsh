# Only proceed if FZF path is defined and valid
if [[ -n "$FZF_INSTALL_PATH" && -d "$FZF_INSTALL_PATH" ]]; then
  source "$FZF_INSTALL_PATH/key-bindings.zsh"
  source "$FZF_INSTALL_PATH/completion.zsh"
else
  return
fi

# Unbind default ALT-c mapping (to avoid conflict)
bindkey -rM emacs '\ec'
bindkey -rM vicmd '\ec'
bindkey -rM viins '\ec'

# Bind CTRL-e to a custom directory search widget
zle     -N              fzf-cd-widget
bindkey -M emacs '\C-e' fzf-cd-widget
bindkey -M vicmd '\C-e' fzf-cd-widget
bindkey -M viins '\C-e' fzf-cd-widget

# Custom fzf completion runner
_fzf_comprun() {
    local command=$1
    shift

    case "$command" in
        cd)           find . -type d | fzf --preview 'tree -C {}' "$@";;
        *)            fzf "$@" ;;
    esac
}

# File and directory listing using ripgrep and fd for fzf
_fzf_compgen_path() {
    rg --files --glob "!.git" "$1"
}

_fzf_compgen_dir() {
   fd --type d --hidden --follow --exclude ".git" "$1"
}

