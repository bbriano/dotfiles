call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'preservim/nerdcommenter'
call plug#end()

let mapleader=" "
nmap <Esc> :nohl<CR><C-l>
nmap CommandP :Files<CR>
map CommandSlash <plug>NERDCommenterToggle

" Nerd commenter shit
filetype plugin on
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1

syntax on
colorscheme dim
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set nowritebackup
set incsearch
set laststatus=0
set relativenumber
set ignorecase

autocmd Filetype markdown setlocal ts=2 sts=2 sw=2

