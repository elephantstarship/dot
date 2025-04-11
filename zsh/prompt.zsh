autoload -Uz colors && colors

function update_prompt() {
  local cwd="${PWD##*/}"
  local venv=""
  [[ -n "$VIRTUAL_ENV" ]] && venv="%F{240}${VIRTUAL_ENV:t}%f " || venv=""

  if [[ $KEYMAP == vicmd ]]; then
    PROMPT="%B%F{242}∷%f %F{242}${cwd}%f%b "
  else
    PROMPT="${venv}%B%F{242}${cwd}%f%b "
  fi
}

function zle-keymap-select {
  update_prompt
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-init {
  update_prompt
  zle reset-prompt
}
zle -N zle-line-init

precmd_functions+=(update_prompt)
