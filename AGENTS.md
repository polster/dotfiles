# AGENTS.md

This repository contains personal dotfiles, setup scripts, and helper tooling
for a macOS developer environment. Use this guide when acting as an agentic
coding assistant in this repo.

## Repository orientation

- Root contains `Brewfile`, `makefile`, and top-level setup docs.
- `dotfiles/` contains the stow-managed configuration files.
- `podman/`, `sdkman/`, `vscode/`, `zsh/` contain helper scripts.
- Docs are in `README.adoc` and `docs/*.adoc`.

## Cursor/Copilot rules

- No `.cursor/rules/`, `.cursorrules`, or `.github/copilot-instructions.md`
  found in this repo. If these are added later, follow them.

## Prerequisites

- macOS (Apple Silicon) is assumed.
- Homebrew is required.
- `pre-commit` is used for lint-style checks.

## Build, lint, and test commands

This repo is configuration-focused and does not have a traditional build/test
suite. Use the following commands when relevant:

- Install packages: `brew bundle`
- Install dotfiles via stow: `make dotfiles-install`
- Uninstall dotfiles: `make dotfiles-uninstall`
- Install pre-commit hooks: `make pre-commit-install`
- Run all pre-commit hooks: `make pre-commit-run`
- Install zsh: `make package-install-zsh`
- Install sdkman: `make package-install-sdkman`
- VSCode extensions install: `make vscode-extensions-install`
- VSCode extensions dump: `make vscode-extensions-dump`
- Podman Docker emulation install: `make podman-docker-emulation-install`
- Podman Docker emulation remove: `make podman-docker-emulation-remove`

### Running a single test or single lint

There is no test runner or per-test command defined in this repo. The closest
equivalent is running individual pre-commit hooks by name:

- List hooks: check `.pre-commit-config.yaml`
- Run a single hook: `pre-commit run <hook-id> --all-files`

Examples of hook IDs in this repo:

- `trailing-whitespace`
- `end-of-file-fixer`
- `check-merge-conflict`
- `check-added-large-files`
- `check-yaml`
- `check-json`
- `check-toml`
- `check-executables-have-shebangs`

## Code style guidelines

These guidelines reflect the existing scripts and config style in the repo.
Follow the surrounding file conventions when making changes.

### Shell scripts (bash)

- Shebang: use `#!/usr/bin/env bash`.
- Indentation: 2 spaces inside conditionals and blocks.
- Conditionals: prefer `[[ ... ]]` over `[ ... ]` when available.
- Variables: use uppercase for constants and environment-like variables
  (e.g., `SCRIPT_DIR`, `USER_BIN`).
- Quoting: wrap variable expansions in double quotes unless intentionally
  relying on word splitting.
- Command existence: use `command -v` or `which` checks when needed.
- Error handling: simple `error` helper functions are acceptable for scripts
  that exit on failure.
- Keep scripts short and task-focused; avoid introducing new dependencies.

### Makefile

- Respect existing target naming (`package-install-*`, `dotfiles-*`).
- Use `.PHONY` for non-file targets.
- Keep commands concise and consistent with current `makefile` patterns.

### Configuration files

- Preserve existing formats and syntax (YAML, JSON, TOML, adoc).
- Keep keys ordered as they are in the file; avoid reformatting unrelated
  sections.
- For new config entries, follow the local style of the file you edit.

### Formatting

- Prefer minimal diffs; avoid reformatting unrelated lines.
- Keep files ASCII unless the file already uses Unicode.
- Ensure files end with a newline (pre-commit enforces this).

### Imports and modules

- This repo is primarily shell and config; no shared module import style.
- If adding code in other languages, follow that file's conventions.

### Types and naming

- Use descriptive names over abbreviations in scripts and docs.
- Keep environment variable names uppercase with underscores.
- For function names in bash, use simple lower_snake_case or lowerCamel
  and match the file's existing style.

### Error handling

- For scripts that modify the system, fail fast on invalid inputs.
- Prefer explicit checks with readable messages (see `podman/podman_emulation.sh`).
- Avoid silent failures; exit non-zero on error.

## Pre-commit hooks

Hooks are defined in `.pre-commit-config.yaml` and include:

- whitespace and EOF fixes
- merge conflict checks
- added large files check
- YAML/JSON/TOML checks
- executable shebang checks

If you add new file types, ensure they pass existing hooks.

## Safe operations

- Do not remove user data or dotfiles unless explicitly asked.
- Avoid destructive operations in install scripts.
- Respect `.gitignore` and avoid committing generated files.

## Documentation

- Primary docs live in `README.adoc` and `docs/*.adoc`.
- When updating docs, keep AsciiDoc formatting consistent.

## When unsure

- Follow existing patterns in the closest file.
- Keep changes small and reviewable.
- Prefer Make targets over ad-hoc shell commands.
