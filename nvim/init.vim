call plug#begin('~/.vim/plugged')
Plug 'bbriano/ansi.vim'
Plug 'dense-analysis/ale'
Plug 'dstein64/vim-startuptime'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } | Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'justinmk/vim-ipmotion'
Plug 'michaeljsmith/vim-indent-object'
Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
call plug#end()

let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"
let g:UltiSnipsJumpForwardTrigger="<TAB>"
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_linters = {
\   'markdown': ['proselint'],
\   'python': ['jedils', 'mypy'],
\   'text': ['proselint'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'go': ['goimports'],
\}
let g:ip_skipfold = 1
let g:markdown_folding = 1
let g:netrw_banner = 0
let g:netrw_dirhistmax = 0
let g:netrw_list_hide = '^\.\.\?\/$'
let mapleader = ' '

colorscheme ansi
set noswapfile
set expandtab tabstop=4 softtabstop=-1 shiftwidth=4
set incsearch ignorecase smartcase
set hidden
set nowrap
set signcolumn=no
set laststatus=1
set guicursor=
set foldmethod=indent foldlevel=99
set completeopt=menuone,noinsert,noselect
set shortmess=I

nnoremap <silent> <esc>     :nohl<CR><C-L>
nnoremap Q                  <nop>
cnoremap <C-a>              <C-b>
nnoremap Y                  y$
nnoremap <expr> *           'mm:%s/\<'.expand('<cword>').'\>//gn<CR>`m'
vnoremap p                  "_dP

nnoremap S                  :bprevious<CR>
nnoremap s                  :bnext<CR>

nnoremap <silent> <down>    :resize +1<CR>
nnoremap <silent> <up>      :resize -1<CR>
nnoremap <silent> <right>   :vertical resize +1<CR>
nnoremap <silent> <left>    :vertical resize -1<CR>

vnoremap <C-h>              hoho
vnoremap <C-j>              jojo
vnoremap <C-k>              koko
vnoremap <C-l>              lolo

nnoremap <leader>S          :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>l          :buffer #<CR>
nnoremap <leader>x          :bdelete<CR>
nnoremap <leader>d          :bnext \| bdelete #<CR>
nnoremap <leader>s          :%s///g<left><left>
vnoremap <leader>s          :s///g<left><left>
nnoremap <leader>qq         :s/\. /\.\r/g<CR>
nnoremap <leader>fn         :put =expand('%:t')<CR>
vnoremap <leader>p          yPgv:!python3<CR>
nnoremap <leader>td         :execute 'e' strftime("~/notes/%Y/%Y-%m-%d.md")<CR>
nnoremap <leader>ss         :call <SID>SynStack()<CR>

nnoremap [g                 :ALEPreviousWrap<CR>
nnoremap ]g                 :ALENextWrap<CR>
nnoremap gy                 :ALEGoToTypeDefinition<CR>
nnoremap gd                 :ALEGoToDefinition<CR>
nnoremap gr                 :ALEFindReference<CR>
nnoremap K                  :ALEHover<CR>
nnoremap <leader>rn         :ALERename<CR>
nnoremap <leader>ca         :ALECodeAction<CR>
nnoremap <leader>lr         :ALEReset<CR>

nnoremap <C-p>              :Files<CR>
nnoremap <C-n>              :Files ~<CR>
nnoremap <C-s>              :Buffers<CR>
nnoremap <leader>ff         :Files %:h<CR>
nnoremap <leader>/          :Rg<CR>
nnoremap <leader>h          :Help<CR>

command! W w
command! Q q
command! PU PlugUpgrade | PlugUpdate

augroup BRIANO
    autocmd!
    autocmd BufRead,BufNewFile *.tex setlocal filetype=tex
    autocmd BufWritePre * ALEFix
augroup END

" Show syntax highlighting groups for word under cursor
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
