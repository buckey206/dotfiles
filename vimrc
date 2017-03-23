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
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-markdown'
Plug 'reedes/vim-colors-pencil'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'reedes/vim-pencil'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'nelstrom/vim-markdown-folding'
Plug 'christoomey/vim-tmux-navigator'
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
"autocmd BufNewFile,BufReadPost *.md set filetype=markdown
nnoremap <Space> za

if has("autocmd")
	filetype plugin indent on
endif
