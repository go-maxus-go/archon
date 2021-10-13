set nocompatible              " be iMproved, required
filetype off                  " required

"==============================================================================
"General settings
"vim behaviour"
set path+=**
set directory=~/.vim/swapfiles/
set mouse=a
filetype on
set ruler
set autoread
set cindent
set foldmethod=manual

"Vim view"
set number
syntax enable
set background=dark
colorscheme desert
set t_Co=256
"hi Normal ctermbg=233
set cursorline
set showcmd
set wildmenu
set showmode
set visualbell

" color, terminal: bg = #003045, cursor = red
highlight ColorColumn ctermbg=23
set colorcolumn=81

"encoding"
set ff=dos
set encoding=utf-8 "The encoding displayed."
set fileencoding=utf-8 "The encoding written to file."
scriptencoding utf-8

"Invisible symbols"
set listchars=space:·,tab:>·
set list
set backspace=indent,eol,start

"search options
set incsearch
set hlsearch

"indents"
set autoindent
set cindent

"tabs"
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set smarttab

"Swap ; and : for faster entering in command mode"
nnoremap ; :
nnoremap : ;

"Go to normal mode"
inoremap jk <ESC>
inoremap kj <ESC>

"Ctlr+S to save file
inoremap <C-s> <ESC>:w<CR>
nnoremap <C-s> :w<CR>

"Case insensitive search
nnoremap / /\c
nnoremap ? ?\c

"Speed up keyboard scrolling"
nnoremap <C-Y> 3<C-Y>
nnoremap <C-E> 3<C-E>

"Mouse wheel"
nnoremap <ScrollWheelUp>      6<C-Y>
nnoremap <ScrollWheelDown>    6<C-E>
nnoremap <C-ScrollWheelUp>     <C-U>
nnoremap <C-ScrollWheelDown>   <C-D>
