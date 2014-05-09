set nocompatible

" Pathogen 
call pathogen#infect()
call pathogen#helptags()
 
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
filetype plugin indent on
 
syntax on
set number
set mouse=a
set mousehide
set paste

" Use persistent undos.  Make sure that undodir has been created
set undofile
set undodir=~/.vimundo/

set spell
set hlsearch
set showmatch
set incsearch
set ignorecase
set autoindent
set history=1000
set cursorline
set laststatus=2

if has("unnamedplus")
  set clipboard=unnamedplus
elseif has("clipboard")
  set clipboard=unnamed
endif

set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

set background=dark
colorscheme solarized

" vimmarkdown
let g:vim_markdown_folding_disabled=1

