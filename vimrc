"USABILITY CONFIGURATION ----------------------
"Basic and pretty much needed settings to provide a solid base for
"Download curl
"add export TERM=xterm-256color to ~/.bashrc

"---------- PLUGIN CONFIGURATION --------
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'bling/vim-airline' " fancy statusline
Plug 'benmills/vimux' " vim and tmux plugin
Plug 'tpope/vim-commentary' " comment stuff out 
Plug 'tpope/vim-surround' " mapping to delete, change and add suroundings in pairs
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-markdown', {'for': 'markdown'}
Plug 'ervandew/supertab'

Plug 'scrooloose/syntastic' " syntax plugin " HTML Plugins
Plug 'gregsexton/MatchTag', { 'for': 'html' } " match tags in html, similar to paren support
Plug 'mattn/emmet-vim', { 'for' : 'html' }
Plug 'othree/html5.vim', { 'for': 'html' } " html5 support

"color plugins
" Plug 'flazz/vim-colorschemes' " add tons of colorschemes
Plug 'chriskempson/base16-vim'

call plug#end()


"color config
set background=dark
colorscheme base16-default
let base16colorspace=256 " Access color present in 256 colorspace
" set t_Co=256 "use 256 colors

" don't make vim compatible with vi 
set nocompatible

syntax on

"show line numbers
set number

" Tab control
set noexpandtab " insert tabs rather than spaces for <Tab>
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'
set autoindent " align the new line indent with the previous.

set history=500 " make vim save 1000 commands 
set textwidth=80

"vim-airline config
set laststatus=2
"simple separators for buffer list
let g:airline_left_sep=''
let g:airline_right_sep=''
"don't count trailing whitespace since it lags in huge files
let g:airline#extensions#whitespace#enabled = 0
" disable to improve fugitive performance
let g:airline#extensions#branch#enabled = 0
" put a buffer list at the top
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
