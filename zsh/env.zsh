# Core paths
export DOTFILES="$HOME/.dot"
export CONFIG_HOME="$HOME/.config"

# Terminal and editor
export TERM='xterm-256color'
export EDITOR='vim'
export VISUAL='vim'

# Locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# FZF (default behavior, profile can override install path)
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_COMPLETION_DIR_COMMANDS="cd pushd rmdir tree ls"

export FZF_DEFAULT_OPTS="--height=60% \
--layout=reverse \
--border=rounded \
--prompt='⟩ ' \
--pointer='→' \
--marker='•' \
--color=fg:#a8a8a8,bg:#1c1c1c,fg+:#ffffff,bg+:#2e2e2e,hl:#87afd7,hl+:#87afd7,\
info:#5f5f5f,prompt:#5f5f5f,spinner:#87afd7,pointer:#87afd7,marker:#87afd7,border:#444444"

export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -n 20' --preview-window=right:60%:wrap:hidden"

# Go
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
