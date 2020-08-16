call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
call plug#end()

let g:ale_linters_explicit = 1
let g:ale_linters = {
\   'python': ['mypy'],
\}
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'c': ['clang-format'],
\   'cpp': ['clang-format'],
\   'html': ['prettier'],
\   'css': ['prettier'],
\   'scss': ['prettier'],
\   'javascript': ['prettier'],
\   'markdown': ['prettier'],
\   'python': ['black'],
\}

let mapleader=" "
nnoremap <Esc> :nohl<CR><C-l>
nnoremap <Leader><Leader> <C-^>
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <C-p> :Files<CR>
nnoremap <silent> <C-k> <Plug>(ale_previous_wrap)
nnoremap <silent> <C-j> <Plug>(ale_next_wrap)
tnoremap <Esc> <C-\><C-n>

syntax on
colorscheme dim
highlight clear SignColumn
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set incsearch
set ignorecase
set smartcase
set number
set relativenumber
set nowrap
set hidden
set laststatus=0
set mouse=a
set noswapfile
set nobackup
set nowritebackup
set updatetime=0

autocmd Filetype markdown setlocal ts=2 sts=2 sw=2
