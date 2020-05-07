if [ -d "$HOME/bin" ]; then PATH="$HOME/bin:$PATH" ; fi
if [ -d "$HOME/.local/bin" ] ; then PATH="$HOME/.local/bin:$PATH" ; fi
if [ -f "$HOME/.aliases" ] ; then . $HOME/.aliases ; fi
if [ -f "$HOME/.env" ] ; then . $HOME/.env ; fi

export ZSH="/home/anton/.oh-my-zsh"

plugins=(git)

source $ZSH/oh-my-zsh.sh
