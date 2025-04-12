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
	@./scripts/install-zsh.sh

vim:
	@echo "→ vim"
	@./scripts/install-vim.sh

tmux:
	@echo "→ tmux"
	@./scripts/install-tmux.sh

ghostty:
	@echo "→ ghostty"
	@./scripts/install-ghostty.sh

completions:
	@echo "→ completions"
	@./scripts/install-completions.sh

clean:
	@echo "→ clean"
	@./scripts/clean.sh

test:
	@echo "→ test"
	@./scripts/test.sh
