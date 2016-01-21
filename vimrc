"USABILITY CONFIGURATION ----------------------
"Basic and pretty much needed settings to provide a solid base for
"source code editting
"install vundle with git clone
"mkdir -p ~/.vim/bundle/vundle 
"git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
" don't make vim compatible with vi 
set nocompatible

"turn on syntax highlighting
syntax on
"and show line numbers
set number

"make vim try to detect file types and load plugins for them
filetype on
filetype plugin on
filetype indent on

"reload files changed outside vim
set autoread         

"use 256 colors 
set t_Co=256
"encoding is utf 8
set encoding=utf-8
set fileencoding=utf-8

"enable matchit plugin which ships with vim and greatly enhances '%'
runtime macros/matchit.vim

"set unix line endings
set fileformat=unix
" when reading files try unix line endings then dos, also use unix for new
" buffers
set fileformats=unix,dos

" save up to 100 marks, enable capital marks
set viminfo='100,f1

" F7 will enable spellcheck in english
map <F7> :setlocal spell spelllang=en_us<CR>
" ---------------------- PLUGIN CONFIGURATION ----------------------
" initiate Vundle
let &runtimepath.=',$HOME/.vim/bundle/Vundle.vim'
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" start plugin defintion

"install vim-airline
Plugin 'bling/vim-airline'

" install vim-surround
Bundle 'tpope/vim-surround'

"install colors
Plugin 'flazz/vim-colorschemes'

" end plugin definition
call vundle#end()            " required for vundle

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
