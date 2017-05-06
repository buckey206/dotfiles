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
Plug 'tpope/vim-surround'

Plug 'mhinz/vim-startify'
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

" Startify
let g:startify_bookmarks=[ '~/notes/quicknotes.md' ]

let g:ascii = [
         \ '        __',
         \ '.--.--.|__|.--------.',
         \ '|  |  ||  ||        |',
         \ ' \___/ |__||__|__|__|',
         \ ''
         \]
let g:startify_custom_header= map(g:ascii,  '"    ".v:val')

