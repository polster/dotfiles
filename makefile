#!makefile

DOTFILES_DIR := dotfiles
TARGET_DIR := $(HOME)

.PHONY: package-install-%
package-install-%:
	./$*/install_$*.sh

.PHONY: dotfiles-install
dotfiles-install:
	@(cd $(DOTFILES_DIR) && exec stow -t $(TARGET_DIR) -S *)

.PHONY: vscode-extensions-%
vscode-extensions-%:
	./vscode/vscode_extensions.sh $*