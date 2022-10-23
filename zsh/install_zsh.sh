#!/usr/bin/env bash

# Location of zsh, if installed via brew
ZSH="/usr/local/bin/zsh"
# Known shells
SHELLS="/etc/shells"
# Current user
USER=$(whoami)

# Install zsh if not present
if command -v ${ZSH} &> /dev/null
then
  echo "zsh already installed, cool."
else
  echo "Installing zsh"
  brew install zsh
fi

# Install oh-my-zsh if not present
if [ -d "${HOME}/.oh-my-zsh" ]
then
  echo "oh-my-zsh already installed, cool."
else
  echo "Installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Set zsh as the shell for current user, if not set
if [ $(echo $0) == ${ZSH} ]
then
  echo "zsh already set as shell for current user."
else
  echo "Setting zsh as shell for curren user"
  sudo -s -- <<EOF
    grep -q ${ZSH} ${SHELLS} || echo ${ZSH} >> ${SHELLS}
    chsh -s ${ZSH} ${USER}
EOF
fi