#!/bin/sh

if [ -z $(uname -a | grep -oiE '(Ubuntu|microsoft|raspberry)') ]
then 
    echo 'This script meant to run only on Ubuntu distros'
    exit
fi

# installing main tools
apt install git zsh tmux vim golang -y

# changing default shell
if [ $SHELL != "/bin/zsh" ]
then 
	if [ ! -z $(cat /etc/shells | grep -E '/bin.zsh') ]
	then
		echo "Installing /bin/zsh"
		apt-get install zsh
	fi
	echo "Changing $SHELL to /bin/zsh"
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


# installing rust:
if [ -z "$(rustup --version 2> /dev/null)" ];
then
    echo "Installing rust..."		
	curl --proto '=https' --tlsv1.3 https://sh.rustup.rs -sSf | sh
fi


# installint tpm:
if [ ! -d "$HOME/.tmux/plugins/tpm" ];
then
	echo "Installing tpm..."
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi


# copying config files into $HOME
FILES="$(find .  -maxdepth 1 -type f -name '*' -a ! -name 'install.*.sh' ! -name '*.md')"
cp $FILES $HOME/
rm ~/.bash* 2> /dev/null
