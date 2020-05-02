syntax on

call plug#begin('~/.vim/plugged')

Plug 'sgur/vim-editorconfig'
Plug 'scrooloose/syntastic'

Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'valloric/youcompleteme'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

call plug#end()

set ttyfast
set number
set noshowmode
set autowrite
set laststatus=2
set tabstop=4

let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_conf.py'
let g:ycm_confirm_extra_conf=1

if filereadable(expand("~/.vimrc.plug"))
	source ~/.vimrc.plug
endif

map <silent> <C-k>b :NERDTreeToggle<CR>

if !has('gui_running')
	set t_Co=256
endif

