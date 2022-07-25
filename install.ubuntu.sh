#!/bin/sh

if [ -z $(uname -a | grep -oiE '(Ubuntu|microsoft)') ]
then 
    echo 'This script meant to run only on Ubuntu distros'
    exit
fi

# installing main tools
apt install git zsh tmux vim golang -y

# changing default shell
if [ $SHELL != "/bin/zsh" ]
then 
    chsh -s $(which zsh) $(whoami)
fi

# installing oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]
then 
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ ! -f "$HOME/.vim/autoload/plug.vim" ]
then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# copying config files into $HOME
FILES="$(find .  -maxdepth 1 -type f -name '*' -a ! -name 'install.*.sh' ! -name '*.md')"
cp $FILES $HOME/
rm ~/.bash*
