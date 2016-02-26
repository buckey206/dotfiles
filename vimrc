"USABILITY CONFIGURATION ----------------------
"Basic and pretty much needed settings to provide a solid base for
"Download curl
"add export TERM=xterm-256color to ~/.bashrc

" don't make vim compatible with vi 
set nocompatible

"use 256 colors 
set t_Co=256

"show line numbers
set number

" F7 will enable spellcheck in english
map <F7> :setlocal spell spelllang=en_us<CR>

"set tabs at 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab
"---------- PLUGIN CONFIGURATION --------
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'bling/vim-airline'
Plug 'tpope/vim-surround' " mapping to delete, change and add suroundings in pairs
Plug 'flazz/vim-colorschemes' " add tons of colorschemes
Plug 'scrooloose/syntastic' " syntax plugin
Plug 'gregsexton/MatchTag', { 'for': 'html' } " match tags in html, similar to paren support
Plug 'othree/html5.vim', { 'for': 'html' } " html5 support
call plug#end()

"color config
syntax on
colorscheme zenburn

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
