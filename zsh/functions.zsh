cleanup_branches() {
    git fetch -p && for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); do git branch -D $branch; done
}

extract() {
  if [[ -f "$1" ]]; then
    case "$1" in
      *.tar.bz2) tar xjf "$1" ;;
      *.tar.gz)  tar xzf "$1" ;;
      *.bz2)     bunzip2 "$1" ;;
      *.rar)     unrar x "$1" ;;
      *.gz)      gunzip "$1" ;;
      *.tar)     tar xf "$1" ;;
      *.tbz2)    tar xjf "$1" ;;
      *.tgz)     tar xzf "$1" ;;
      *.zip)     unzip "$1" ;;
      *.Z)       uncompress "$1" ;;
      *.7z)      7z x "$1" ;;
      *)         echo "'$1' cannot be extracted" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

cheat() {
  local query
  query=$(curl -s https://cht.sh/:list | fzf --prompt="cheat> ")
  [[ -n "$query" ]] && curl -s "https://cht.sh/$query" | less -R
}

htoggle() {
  if [[ -n "$HISTFILE" ]]; then
    unset HISTFILE
    echo "history off"
  else
    export HISTFILE="$HOME/.zhistory"
    echo "history on"
  fi
}

