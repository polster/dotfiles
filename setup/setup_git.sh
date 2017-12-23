#!/usr/bin/env bash

echo "Configuring Git..."

# Install dependencies
sudo apt-get install -y \
    vim \
    kdiff3

echo "Enter git user name: "
read GIT_USER_NAME
echo "Enter git user email: "
read GIT_USER_EMAIL

# Set user config
git config --global user.name "$GIT_USER_NAME"
git config --global user.email "$GIT_USER_EMAIL"
# Set default editor
git config --global core.editor vim
# Set diff tool
git config --global merge.tool kdiff3
# Add git hist
git config --global alias.hist "log --pretty=format:'%C(yellow)[%ad]%C(reset) %C(green)[%h]%C(reset) | %C(red)%s %C(bold red){{%an}}%C(reset) %C(blue)%d%C(reset)' --graph --date=short"
# List current config
git config --list