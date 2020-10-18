syntax on
filetype plugin on
set nocompatible
set number
set ruler
set nowrap
set tabstop=2
set shiftwidth=2 
set expandtab
set softtabstop=2
set shiftround
set history=50
set bs=indent,eol,start
set ai
set ic
set tw=79
set colorcolumn=80
set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase
set cursorline
set background=dark
colorscheme jellybeans
setlocal spell spelllang=en,de
autocmd BufEnter *.s set nospell                                               
autocmd BufEnter *.c set nospell                                               
autocmd BufEnter *.rb set nospell                                               
autocmd BufEnter *.hs set nospell                                               
autocmd BufEnter *.cf set nospell
autocmd BufEnter *.cpp set nospell                                               
autocmd BufEnter *.sml set nospell                                               
autocmd BufEnter *.spec set nospell                                               
let mapleader = ","
nnoremap <c-t> :tabnew<cr>
nnoremap <tab> gt
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ov :e $MYVIMRC<cr>
inoremap jk <esc>
"inoremap <esc> <nop>
"inoremap <Up> <nop>
"inoremap <Down> <nop>
"inoremap <Left> <nop>
"inoremap <Right> <nop>
