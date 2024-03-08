#!/bin/sh

function sync() {
    echo "Impl"
    # TODO : 
    # 1. gather names of all files in this folder, 
    # 2. find them in $HOME and 
    # 3. copy them into repo 
}

function set_macos_defaults() {
    defaults write com.apple.dock orientation left
    defaults write com.apple.screencapture type jpg
    defaults write com.apple.dock autohide-delay -float 0
    defaults write com.apple.dock autohide -boolean true
    defaults write com.apple.dock autohide-time-modifier -int 0
    killall Dock
}

function install() {
    if [ $SHELL !=  "/bin/zsh" ]
    then
	chsh -s /bin/zsh	
    fi

    if [[ ! -x $(which nvm) ]]
    then
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

        source ./.env

        nvm install node
    fi

    if [[ ! -x $(which brew) ]]
    then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    # install alacrittty if missing
    ! command -v alacritty > /dev/null && brew install --cask alacritty

    # install neovim if missing
    ! command -v nvim > /dev/null && brew install neovim

    # install neovim if missing
    ! command -v tmux > /dev/null && brew install tmux

    # installing tpm:
    if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
        echo "Installing tpm..."
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    fi

    if [ ! -d "$HOME/.config" ]
    then
	mkdir "$HOME/.config"	
    fi

    cp -r ./nvim "$HOME/.config/"

    if [ ! -d "$HOME/.oh-my-zsh" ]
    then
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi

    # copying config files into $HOME
    FILES="$(find .  -maxdepth 1 -type f -name '*' -a ! -name 'install.*.sh' ! -name '*.md')"

    cp $FILES $HOME/

    rm ~/.bash* 2> /dev/null
}

if [[ $1 == '--sync' ]]
then 
    sync
else
    install
    if [[ $(uname) == 'Darwin' ]]
    then
        set_macos_defaults
    else
        echo 'This script meant to run only on macOS'
        exit
    fi
fi
