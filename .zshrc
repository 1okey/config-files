if ! xset q &>/dev/null; then
	startx
fi

if [ -d "$HOME/bin" ]; then PATH="$HOME/bin:$PATH" ; fi
if [ -d "$HOME/.local/bin" ]; then PATH="$HOME/.local/bin:$PATH" ; fi
if [ -d "/snap" ]; then PATH="/snap/bin:$PATH"; fi

if [ -f "$HOME/.aliases" ]; then . $HOME/.aliases ; fi
if [ -f "$HOME/.env" ]; then . $HOME/.env ; fi
if [ -f "$HOME/.cargo/env" ]; then . $HOME/.cargo/env ; fi

export ZSH="$HOME/.oh-my-zsh"
export GOPATH="$HOME/go"

plugins=(git)

source $ZSH/oh-my-zsh.sh
