set nocompatible

" Pathogen 
call pathogen#infect()
call pathogen#helptags()
 
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
filetype plugin indent on
 
syntax on
set number
set mouse=a             " hold shift to copy xterm
set ttymouse=xterm2     " necessary for gnu screen & mouse
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
set shiftwidth=4
set tabstop=2
set softtabstop=4

set background=dark
colorscheme solarized

" vimmarkdown
let g:vim_markdown_folding_disabled=1

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END
