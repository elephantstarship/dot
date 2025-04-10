.PHONY: all zsh vim tmux ghostty clean completions help check

DOTFILES := $(CURDIR)
CONFIG_HOME ?= $(HOME)/.config

export DOTFILES
export CONFIG_HOME

.DEFAULT_GOAL := help

help:
	@echo "Usage:"
	@echo "  make zsh       	Install Zsh config"
	@echo "  make vim       	Install Vim config"
	@echo "  make tmux      	Install Tmux config"
	@echo "  make ghostty   	Install Ghostty config (requires INSTALL_GHOSTTY=1)"
	@echo "  make completions   Generate ZSH completions"
	@echo "  make check			Verify required tools"
	@echo "  make all       	Install all configs"
	@echo "  make clean     	Remove symlinks"


check:
	@echo "→ checking requirements"
	@for cmd in curl fzf make rg tmux vim zsh; do \
	  command -v $$cmd >/dev/null || echo "missing: $$cmd"; \
	done

all: check zsh vim tmux completions
	@if [ "$(INSTALL_GHOSTTY)" = "1" ]; then $(MAKE) ghostty; fi

zsh:
	@echo "→ zsh"
	@./install/install-zsh.sh

vim:
	@echo "→ vim"
	@./install/install-vim.sh

tmux:
	@echo "→ tmux"
	@./install/install-tmux.sh

ghostty:
	@echo "→ ghostty"
	@./install/install-ghostty.sh

completions:
	@echo "→ completions"
	@mkdir -p ~/.zfunc
	@command -v kubectl >/dev/null && kubectl completion zsh > ~/.zfunc/_kubectl || true
	@command -v helm >/dev/null && helm completion zsh > ~/.zfunc/_helm || true
	@command -v flux >/dev/null && flux completion zsh > ~/.zfunc/_flux || true
	@command -v tkn >/dev/null && tkn completion zsh > ~/.zfunc/_tkn || true
	@command -v docker >/dev/null && docker completion zsh > ~/.zfunc/_docker || true
	@command -v podman >/dev/null && podman completion zsh > ~/.zfunc/_podman || true
	@command -v eksctl >/dev/null && eksctl completion zsh > ~/.zfunc/_eksctl || true
	@[ -x /opt/homebrew/bin/aws_completer ] && echo 'complete -C /opt/homebrew/bin/aws_completer aws' > ~/.zfunc/_aws || true

clean:
	@echo "→ clean"
	@rm -f $(HOME)/.zshenv
	@rm -f $(HOME)/.zshrc
	@rm -f $(HOME)/.zprofile
	@rm -f $(HOME)/.vimrc
	@rm -f $(CONFIG_HOME)/tmux/tmux.conf
	@rm -f $(CONFIG_HOME)/tmux/zenwritten.tmux
	@rm -f $(CONFIG_HOME)/ghostty/config

