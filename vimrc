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
"Plug 'edkolev/tmuxline.vim' "fancy tmux statusline
Plug 'benmills/vimux' " vim and tmux plugin
Plug 'tpope/vim-commentary' " comment stuff out 
Plug 'tpope/vim-surround' " mapping to delete, change and add suroundings in pairs
Plug 'tpope/vim-repeat'
Plug 'ervandew/supertab' " autocomplete with tab

"MARKDOWN Plugins
Plug 'tpope/vim-markdown', {'for': 'md'}

" PYTHON Plugins
Plug 'klen/python-mode', {'for': 'py'}
"HTML Plugins
Plug 'scrooloose/syntastic' " syntax plugin 
Plug 'gregsexton/MatchTag', { 'for': 'html' } " match tags in html 
Plug 'mattn/emmet-vim', { 'for' : 'html' }
Plug 'othree/html5.vim', { 'for': 'html' } " html5 support

"color plugins
"Plug 'flazz/vim-colorschemes' " add tons of colorschemes
Plug 'morhetz/gruvbox'
call plug#end()


"color config
set background=dark
set t_Co=256 "use 256 colors
colorscheme gruvbox
let g:gruvbox_termcolors=256
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_underline=1
let g:gruvbox_bold=1

" don't make vim compatible with vi 
set nocompatible

" syntax settings
syntax on
set showmatch "show matching tags

set number "show line numbers


" Tab control
set textwidth=80
set shiftwidth=4 " number of spaces to use for indent and unindent
set tabstop=4 " the visible width of tabs
set expandtab " insert spaces when hitting Tabs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/Backspace 
set shiftround " round indent to a multiple of 'shiftwidth'
set autoindent " align the new line indent with the previous.

set history=500 " make vim save 1000 commands 

"tmuxline.vim config
"let g:tmuxline_powerline_separators = 0
"let g:tmuxline

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
