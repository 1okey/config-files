
syntax on

set ttyfast
set number

if filereadable(expand("~/.vimrc.plug"))
	source ~/.vimrc.plug
endif

