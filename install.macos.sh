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
    # install vim if missing
    [ ! -x $(command -v vim) ] && brew install vim
    cp .vimrc ~/.vimrc

    # installing zsh if missing
    if [ ! -x $(cat /etc/shells | grep 'zsh') ]
    then
        brew install zsh 
        chsh $(which zsh -s)
    fi

    if [ ! -f "$HOME/.vim/autoload/plug.vim" ]
    then
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi

    if [ ! -d "$HOME/.oh-my-zsh" ]
    then
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi

    # copying config files into $HOME
    FILES="$(find .  -maxdepth 1 -type f -name '*' -a ! -name 'install.sh')"
    cp $FILES $HOME/
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