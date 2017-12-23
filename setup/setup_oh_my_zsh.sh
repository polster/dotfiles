#!/usr/bin/env bash

# Install oh my zsh
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Change the shell
echo "Changing your shell..."
chsh -s /bin/zsh

if [ $? -eq 0 ]; then
  echo "Done, do not forget to reload your shell!"
fi

