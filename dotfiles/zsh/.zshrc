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
plugins=(git history-substring-search)

source $ZSH/oh-my-zsh.sh

####################
# User configuration
####################

# set custom max open file imit
ulimit -n 1024

# Dotfiles
source "$HOME/.dotfiles"

# Custom bins
export PATH=$HOME/bin:/opt/homebrew/bin:$PATH

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

# Open Shift / OKD
if [ -x "$(command -v oc)" ]
then
    alias oc-get-sops='[ -z "$NAMESPACE" ] && { EMPTY=1; echo "Namespace: "; read NAMESPACE; }; OUT=$(oc extract secrets/sops-age -n $NAMESPACE --to $HOME/tmp) ; echo >> $HOME/.config/sops/age/keys.txt ; cat $OUT >> $HOME/.config/sops/age/keys.txt ; echo >> $HOME/.config/sops/age/keys.txt ; rm $OUT; [[ "$EMPTY" -eq 1 ]] && NAMESPACE=""'
    alias oc-rm-sops='[ -z "$NAMESPACE" ] && { EMPTY=1; echo "Namespace: "; read NAMESPACE; }; OUT=$(oc extract secrets/sops-age -n $NAMESPACE --to $HOME/tmp) ; grep -v -F -f $OUT $HOME/.config/sops/age/keys.txt > $HOME/tmp/temp && mv $HOME/tmp/temp $HOME/.config/sops/age/keys.txt; rm $OUT; [[ "$EMPTY" -eq 1 ]] && NAMESPACE=""'
fi

# ruby
if [ -d "$(brew --prefix)/opt/chruby" ]
then
    source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh
    source $(brew --prefix)/opt/chruby/share/chruby/auto.sh
    chruby ruby-3.4.7
fi

# Podman
if [ -x "$(command -v podman)" ]
then
    alias docker="podman"
fi

# Bifrost
if [ -d "$HOME/.bifrost/bin" ]
then
    export PATH="$HOME/.bifrost/bin:$PATH"
fi

if [ -x "$HOME/.local/bin/env" ]
then
    . "$HOME/.local/bin/env"
fi
