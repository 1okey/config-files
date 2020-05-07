#!/bin/sh

# installing main tools
apt install git zsh tmux vim golang -y

# changing default shell
if [ $SHELL != "/bin/zsh" ]; then chsh -s $(which zsh) $(whoami) ; fi

# installing oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" ; fi

# copying config files into $HOME
FILES="$(find .  -maxdepth 1 -type f -name '*' -a ! -name 'install.sh')"
cp $FILES $HOME/