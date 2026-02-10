#!makefile

DOTFILES_DIR ?= $$(pwd)/dotfiles
TARGET_DIR ?= ${HOME}
STOW_IGNORE ?= .env
STOW_INCLUDE ?= *

STOW_CMD := stow \
	--verbose \
	--target $(TARGET_DIR) \
	--stow $(STOW_INCLUDE) \
	--ignore $(STOW_IGNORE)

.PHONY: package-install-%
package-install-%:
	./$*/install_$*.sh

.PHONY: dotfiles-install
dotfiles-install:
	@echo "In case of existing dotfiles, stow will try to adopt them. Use git to clean-up then."
	@(cd $(DOTFILES_DIR) && exec $(STOW_CMD) --adopt)

.PHONY: dotfiles-uninstall
dotfiles-uninstall:
	@(cd $(DOTFILES_DIR) && exec $(STOW_CMD) -D)

.PHONY: vscode-extensions-%
vscode-extensions-%:
	./vscode/vscode_extensions.sh $*

.PHONY: podman-docker-emulation-%
podman-docker-emulation-%:
	./podman/podman_emulation.sh $*

.PHONY: pre-commit-install
pre-commit-install:
	pre-commit install

.PHONY: pre-commit-run
pre-commit-run:
	pre-commit run --all-files
