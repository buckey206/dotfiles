set nocompatible
set number 
set tabstop=4
set mouse=a

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

Plug 'python-mode/python-mode', { 'for': 'python' }

Plug 'vimwiki/vimwiki'
Plug 'itchyny/calendar.vim'

" Markdown Plugins
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'nelstrom/vim-markdown-folding', { 'for': 'markdown' }
"Plug 'reedes/vim-pencil', { 'for': 'markdown' }
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'suan/vim-instant-markdown'


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

"augroup pencil
"  autocmd!
"  autocmd FileType markdown,mkd call pencil#init()
"  autocmd FileType text         call pencil#init()
"augroup END

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

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

let g:pymode_python = 'python3'
let g:pymode_folding = 1


let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki', 
                     \ 'syntax': 'markdown', 'ext': '.md'}]


let g:instant_markdown_autostart = 0 
map <leader>md :InstantMarkdownPreview<CR>

let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
