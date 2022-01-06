call plug#begin()
Plug 'rakr/vim-one'
Plug 'preservim/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-commentary'
Plug 'karb94/neoscroll.nvim'
call plug#end()

" Map leader to Space
let mapleader = " "

" Plug 'rakr/vim-one'
set termguicolors " 24-bit terminal
colorscheme one
set background=dark

" Plug 'preservim/nerdtree'
nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>
" 'm' can be used to open file menu where I can delete the file

" Plug 'dyng/ctrlsf.vim'
"let g:ctrlsf_ackprg = '/usr/bin/rg'
let g:ctrlsf_auto_focus={"at": "start"}
let g:ctrlsf_default_view_mode='compact'

" Set default recursive case insensitive search
nnoremap <leader>F :CtrlSF -R -I ""<Left>
nnoremap <leader>f :CtrlSFToggle<CR>
" Find the word under the cursor
nmap <leader>w <Plug>CtrlSFCwordPath -W<CR>
set modifiable "for find and replace
" 'p' can be used for to open search preview
" find and replace can be done in the result buffer
" using a command like :%s/foo/bar/g

" Plug 'easymotion/vim-easymotion'
nmap <leader>m <Plug>(easymotion-overwin-f)

" Plug 'tpope/vim-commentary'
nnoremap <C-_> :Commentary<CR>
vnoremap <C-_> :Commentary<CR>

" Plug 'karb94/neoscroll.nvim'
lua require('neoscroll').setup({easing_function = "linear"})

" General
set relativenumber
set cursorline
set mouse=a

" Enable copying to system clipboard, xclip is required
set clipboard+=unnamedplus 

" Enable invisible symbols
set list
set listchars=space:·,tab:>·

" Config tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Swap ; and : for faster entering in command mode
nnoremap ; :
nnoremap : ;

" Go to normal mode
inoremap jk <ESC>
inoremap kj <ESC>

" Case insensitive search
nnoremap / /\c
"nnoremap ? ?\c

" Prepare for drag and drop a file into a new tab
nnoremap <leader>t :tabedit 
"nnoremap <C-n> :tabnew<CR>





"  set nocompatible              " be iMproved, required
"  filetype off                  " required
"  
"  "==============================================================================
"  "General settings
"  "vim behaviour"
"  set path+=*h
"  set directory=~/.vim/swapfiles/
"  set mouse=a
"  filetype on
"  set ruler
"  set autoread
"  set cindent
"  set foldmethod=manual
"  
"  "Vim view"
"  set number
"  syntax enable
"  set background=dark
"  colorscheme desert
"  set t_Co=256
"  "hi Normal ctermbg=233
"  set cursorline
"  set showcmd
"  set wildmenu
"  set showmode
"  set visualbell
"  
"  " color, terminal: bg = #003045, cursor = red
"  highlight ColorColumn ctermbg=23
"  set colorcolumn=81
"  
"  "encoding"
"  set ff=dos
"  set encoding=utf-8 "The encoding displayed."
"  set fileencoding=utf-8 "The encoding written to file."
"  scriptencoding utf-8
"  
"  "Invisible symbols"
"  set list
"  set listchars=space:·,tab:>·
"  set backspace=indent,eol,start
"  
"  "search options
"  set incsearch
"  set hlsearch
"  
"  "indents"
"  set autoindent
"  set cindent
"  
"  "tabs"
"  set tabstop=4
"  set softtabstop=4
"  set shiftwidth=4
"  set noexpandtab
"  set smarttab
"  
"  "Swap ; and : for faster entering in command mode"
"  nnoremap ; :
"  nnoremap : ;
"  
"  "Go to normal mode"
"  inoremap jk <ESC>
"  inoremap kj <ESC>
"  
"  "Ctlr+S to save file
"  inoremap <C-s> <ESC>:w<CR>
"  nnoremap <C-s> :w<CR>
"  
"  "Case insensitive search
"  nnoremap / /\c
"  nnoremap ? ?\c
"  
"  "Speed up keyboard scrolling"
"  nnoremap <C-Y> 3<C-Y>
"  nnoremap <C-E> 3<C-E>
"  
"  "Mouse wheel"
"  nnoremap <ScrollWheelUp>      6<C-Y>
"  nnoremap <ScrollWheelDown>    6<C-E>
"  nnoremap <C-ScrollWheelUp>     <C-U>
"  nnoremap <C-ScrollWheelDown>   <C-D>

