#!/bin/sh

if [[ ! -f $(which brew) ]];
then
	echo "Brew not found, installing brew..."
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
# ===================================================
if [[ ! -f $(command -v curl) ]];
then
	echo "Curl not found, installing curl..."
	brew install curl
fi
# ===================================================
if [[ ! -f $(command -v git) ]];
then 
	echo "Git not found, installing git..."
	install git
fi
cp ./.gitconfig ~/.gitconfig
# ===================================================
echo 'Setting up zsh...'
if [[ ! -d $HOME/.oh-my-zsh ]];
then
	brew install zsh
	chsh -s $(which zsh)
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
cp ./.zshrc ~/.zshrc
source ~/.zshrc
# ===================================================
if [[ ! -d $(command -v vim-plug) ]];
then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
echo 'Copying vim config files...'
cp ./vim/.vimrc ~/.vimrc
cp ./vim/.vimrc.plug ~/.vimrc.plug
