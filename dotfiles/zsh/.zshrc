# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="devtheme"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git history-substring-search flow)

source $ZSH/oh-my-zsh.sh

####################
# User configuration
####################

# set custom max open file imit
ulimit -n 1024

# Dotfiles
source "$HOME/.dotfiles"

# Custom bins
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Direnv
if [ -x "$(command -v direnv)" ]
then
    eval "$(direnv hook zsh)"
fi

# sdkman
if [ -d "$HOME/.sdkman" ]
then
    export SDKMAN_DIR="$HOME/.sdkman"
    [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
fi