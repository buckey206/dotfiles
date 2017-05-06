set nocompatible
set number 
set tabstop=4

"---------- PLUGIN CONFIGURATION --------
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'morhetz/gruvbox'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'

Plug 'mhinz/vim-startify'
Plug 'itchyny/vim-cursorword'
Plug 'rafi/vim-tinyline'
Plug 'lifepillar/vim-cheat40'

Plug 'christoomey/vim-tmux-navigator'

" Markdown Plugins
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'reedes/vim-colors-pencil', { 'for': 'markdown' }
Plug 'nelstrom/vim-markdown-folding', { 'for': 'markdown' }
Plug 'reedes/vim-pencil', { 'for': 'markdown' }

"Plug 'davidhalter/jedi-vim'
call plug#end()
"---------- PLUGIN CONFIGURATION ---------

"Color Config
syntax on 
set background=dark
set t_Co=256 "use 256 colors

" Gruvbox
colorscheme gruvbox
let g:gruvbox_termcolors=256
let g:gruvbox_underline=1
let g:gruvbox_bold=1
let g:gruvbox_contrast_dark='hard'

" Make vim background transparent
highlight Normal ctermbg=NONE 

" Markdown 
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Space will toggle folds
nnoremap <Space> za

if has("autocmd")
	filetype plugin indent on
endif



"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup
