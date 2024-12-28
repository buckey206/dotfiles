set nocompatible
syntax enable 
set encoding=utf-8
set showcmd               "display incomplete commands
set number 
filetype plugin indent on " load filetype plugins and indentation

" Tabs 
set tabstop=8       " Tabs are 8 spaces long set expandtab       " Use spaces not tabs 
set shiftwidth=4    " 4 spaces used with autoindent
set softtabstop=4   " <Tab> inserts 4 spaces

" Backspace
set backspace=indent,eol,start " backspace through everything (sane backspace)

" Searching
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive..
set smartcase   " ..unless they have 1 capital letter

" split vertical windows to the right 
set splitright

" use comma as leader key 
let mapleader=','

set cursorline  " Underline current line
set mouse=a     " Can use the mouse

set path+=**    "Add all files in subdirectories to the path

" shows more files when using the :find command
set wildmenu

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

"Plug 'bling/vim-bufferline'
"Plug 'freitass/todo.txt-vim'

"Plug 'scrooloose/nerdtree'

"Plug 'mhinz/vim-startify'
"Plug 'rafi/vim-tinyline'
"Plug 'lifepillar/vim-cheat40'

Plug 'bling/vim-airline'

"Plug 'mileszs/ack.vim'


"Plug 'christoomey/vim-tmux-navigator'

"Plug 'vimwiki/vimwiki'

"Plug 'majutsushi/tagbar'

" Markdown Plugins
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'nelstrom/vim-markdown-folding', { 'for': 'markdown' }
"Plug 'reedes/vim-pencil', { 'for': 'markdown' }
"Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
"Plug 'suan/vim-instant-markdown'


"Plug 'davidhalter/jedi-vim'
call plug#end()
"---------- PLUGIN CONFIGURATION ---------

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

" Buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
set hidden " allow switching away from buffers with unsaved changes

" vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

nmap <Leader>wq <Plug>VimwikiVSplitLink
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki', 
                     \ 'template_path': '~/Dropbox/vimwiki/templates',
                     \ 'template_default': 'default', 
                     \ 'syntax': 'markdown', 'ext': '.md',
                     \ 'path_html': '~/Dropbox/vimwiki/site_html/',}]


map <leader>t :TagbarToggle<CR>

"Color Config
"set background=light
set background=dark
set t_Co=256 "use 256 colors

command Light :set background=light
command Dark :set background=dark


" NERDTree
map <C-n> :NERDTreeToggle<CR>

" Omni completion
set omnifunc=syntaxcomplete#Complete


" awk.vim 
" use ag if available
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
