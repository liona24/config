set shell=/bin/bash
set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'ryanoasis/vim-devicons'

call plug#end()

filetype plugin indent on

set encoding=UTF-8

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'charvaluehex' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ }

colorscheme desert
hi NonText ctermbg=NONE 
hi Normal guibg=NONE ctermbg=NONE

if executable('rg')
    set grepprg=rg\ --no-heading\ --vimgrep
    set grepformat=%f:%l:%c:%m
endif

map <C-p> :FZF<CR>

map <C-n> :Sexplore<CR>
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

set laststatus=2

set t_Co=256

syntax enable
set number relativenumber
let g:rehash256 = 1

set clipboard=unnamed

set noshowmode

set expandtab
set smarttab

set shiftwidth=4
set tabstop=4

set ttyfast

set mouse=a

set splitbelow splitright

set path+=**
set wildmenu
set incsearch
set smartcase
set nobackup

set exrc
set secure

set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

let g:python_highlight_all = 1

autocmd InsertLeave * set nopaste

vnoremap <C-c> "+y
inoremap <C-v> <ESC>"+pa
