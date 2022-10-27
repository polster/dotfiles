#!makefile

DOTFILES_DIR := dotfiles
TARGET_DIR := $(HOME)
STOW_IGNORE := .env
STOW_INCLUDE := *

.PHONY: package-install-%
package-install-%:
	./$*/install_$*.sh

.PHONY: dotfiles-install
dotfiles-install:
	@(cd $(DOTFILES_DIR) && exec stow -t $(TARGET_DIR) -S $(STOW_INCLUDE) --ignore $(STOW_IGNORE))

.PHONY: dotfiles-uninstall
dotfiles-uninstall:
	@(cd $(DOTFILES_DIR) && exec stow -t $(TARGET_DIR) -D $(STOW_INCLUDE))

.PHONY: vscode-extensions-%
vscode-extensions-%:
	./vscode/vscode_extensions.sh $*