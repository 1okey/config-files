
syntax on

set ttyfast

if filereadable(expand("~/.vimrc.plug"))
	source ~/.vimrc.plug
endif

