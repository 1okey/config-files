if [ -d "$HOME/bin" ]; then PATH="$HOME/bin:$PATH" ; fi
if [ -d "$HOME/.local/bin" ]; then PATH="$HOME/.local/bin:$PATH" ; fi
if [ -d "$HOME/snap" ]; then PATH="$HOME/snap:$PATH" ; fi
if [ -d "/snap" ]; then PATH="/snap/bin:$PATH"; fi
if [ -d "/usr/local/go" ]; then PATH="/usr/local/go/bin:$PATH"; fi

if [ -f "$HOME/.aliases" ]; then . $HOME/.aliases ; fi
if [ -f "$HOME/.env" ]; then . $HOME/.env ; fi

export ZSH="$HOME/.oh-my-zsh"

plugins=(git)

source $ZSH/oh-my-zsh.sh
