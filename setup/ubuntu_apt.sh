#!/usr/bin/env bash

apt_packages=()

# List of packages to be installed
apt_packages+=(
  vim
  curl
  jq
  tree
  telnet
  terminator
)

# oh-my-zsh dependencies
apt_packages+=(
  zsh
  git-core
)

if (( ${#apt_packages[@]} > 0 )); then
  for package in "${apt_packages[@]}"; do
    sudo apt-get -qq install "$package"
  done
fi
