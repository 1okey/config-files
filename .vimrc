syntax on

set ttyfast
set number
set noshowmode

set laststatus=2
set tabstop=4

if filereadable(expand("~/.vimrc.plug"))
	source ~/.vimrc.plug
endif

if !has('gui_running')
	set t_Co=256
endif

