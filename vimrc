"USABILITY CONFIGURATION ----------------------
"Basic and pretty much needed settings to provide a solid base for

" don't make vim compatible with vi 
set nocompatible

"turn on syntax highlighting
syntax on

"show line numbers
set number

"reload files changed outside vim
set autoread         

"use 256 colors 
set t_Co=256

"encoding is utf 8
set encoding=utf-8

"enable matchit plugin which ships with vim and greatly enhances '%'
runtime macros/matchit.vim

" when reading files try unix line endings then dos, also use unix for new
" buffers
set fileformats=unix,dos

" save up to 100 marks, enable capital marks
set viminfo='100,f1

" F7 will enable spellcheck in english
map <F7> :setlocal spell spelllang=en_us<CR>
" ---------------------- PLUGIN CONFIGURATION ----------------------
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'bling/vim-airline'
Plug 'tpope/vim-surround'
Plug 'flazz/vim-colorschemes'
call plug#end()

"color config
syntax enable
set background=dark
colorscheme solarized

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
