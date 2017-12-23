#!/usr/bin/env bash

cd "$(dirname "$0")/.."
DOTFILES_ROOT="$(pwd -P)/config"

echo "Installing dot files from $DOTFILES_ROOT"

for src in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '*.symlink')
do
  echo "Trying to symlink $src"
  dst="$HOME/.$(basename "${src%.*}")"
  ln -s "$src" "$dst"
  if [ $? -eq 0 ]; then
    echo "Done"
  fi
done

