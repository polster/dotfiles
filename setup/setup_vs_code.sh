#!/usr/bin/env bash

echo "Installing Visual Studio Code"

# Add repo config
if [ ! -f /etc/apt/trusted.gpg.d/microsoft.gpg ]; then
  echo "Adding apt repo config..."
  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
  sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
  sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
fi

sudo apt-get update
sudo apt-get install code
