#!/bin/sh

if [ -z $(uname -a | grep -oiE '(Ubuntu|microsoft|raspberry)') ]; then 
    echo 'This script meant to run only on Ubuntu distros'
    exit
fi

# installing main tools
sudo apt install git zsh tmux vim golang xclip php mysql-server -y 
sudo snap install nvim --classic 
if [ ! -z $(uname -a | grep -oiE 'microsoft') ]; then
	echo 'Installing wsl tools'
	sudo apt install --no-install-recommends wslu
fi

# changing default shell
if [ $SHELL != "/bin/zsh" ]; then 
	if [ ! -z $(cat /etc/shells | grep -E '/bin/zsh') ]
	then
		echo "Installing /bin/zsh"
		apt-get install zsh
	fi
	echo "Changing $SHELL to /bin/zsh"
	chsh -s $(which zsh) $(whoami)
fi

# installing oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then 
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ -d "$HOME/.config/nvim" ]; then
	cp ./nvim/init.lua "$HOME/.config/nvim"
fi


# installing tpm:
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
	echo "Installing tpm..."
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# installing nvm
if [ ! -d "%HOME/.nvm" ]; then
	echo "Installing nvm..."
	PROFILE=/dev/null && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
fi

# copying config files into $HOME
FILES="$(find .  -maxdepth 1 -type f -name '*' -a ! -name 'install.*.sh' ! -name '*.md')"
cp $FILES $HOME/
rm ~/.bash* 2> /dev/null
