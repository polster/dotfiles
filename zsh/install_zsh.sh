#!/usr/bin/env bash

# Script dir
SCRIPT_DIR="$(dirname "$0")"

# Location of zsh, if installed via brew
ZSH_SHELL="/usr/local/bin/zsh"
# Known shells
SHELLS="/etc/shells"
# Current user
USER=$(whoami)
# Current user shell
CURRENT_SHELL=$(dscl . -read ~/ UserShell | sed 's/UserShell: //')

# Install zsh if not present
if command -v ${ZSH_SHELL} &> /dev/null
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
if [[ "${CURRENT_SHELL}" == "${ZSH_SHELL}" ]]
then
  echo "zsh already set as shell for current user."
else
  echo "Setting zsh as shell for curren user"
  sudo -s -- <<EOF
    grep -q ${ZSH_SHELL} ${SHELLS} || echo ${ZSH_SHELL} >> ${SHELLS}
    chsh -s ${ZSH_SHELL} ${USER}
EOF
fi

# Install custom configuration
cp -R ${SCRIPT_DIR}/custom "${HOME}/.oh-my-zsh"

echo "All set, bye!"