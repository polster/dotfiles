#!makefile

DOTFILES_DIR := dotfiles
TARGET_DIR := $(HOME)

.PHONY: install-package-%
install-package-%:
	./$*/install_$*.sh

.PHONY: install-dotfiles
install-dotfiles:
	@(cd $(DOTFILES_DIR) && exec stow -t $(TARGET_DIR) -S *)