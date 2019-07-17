#! /bin/sh

PLATFORM=`uname`
DISTRO=""

create_symlinks(){
	PATH=`pwd`
	ln -s $PATH/vim/.vimrc $HOME/.vimrc
	ln -s $PATH/vim/.vimrc.plug $HOME/.vimrc.plug
	ln -s $PATH/.gitconfig $HOME/.gitconfig
}

install_ohmyzsh() {
	echo "Installing ohmyzsh..."
	curl -Lo $HOME/install.sh https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
	echo "Applying .zshrc..."
	ln -s $PATH/.zshrc $HOME/.zshrc
	rm $HOME/install.sh
}

install_deps(){
	echo "Running in setup mode, detecting platrofm...\n" 
	if [ $PLATFORM == "Darwin" ] ; then
		echo "Detected platform: ${PLATFORM}, macOS, okay then installing deps..."
		brew install curl zsh	
	elif [ $PLATFORM == "Linux" ] ; then	
		DISTRO=`cat /etc/*-release | grep "DISTIRB_ID=\w*$" | cut -d= -f2`
		echo "Detected platform: ${PLATFORM} distro: $DISTRO"
		if [ $DISTRO == "Ubuntu" ] ; then
			echo "Installing curl and etc. via apt"
			sudo apt-get install curl git zsh
		elif [$DISTRO == "Arch" ] ; then
			echo "Installing deps with pacman"
			sudo pacman -S curl git zsh
		fi
	else
		echo "Coouldn't detect platform/distro, stopping setup..."
		return
	fi
}

install_deps;
install_ohmyzsh;
create_symlinks;
