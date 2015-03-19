
if $TERM == "xterm-256color"
  set t_Co=256
endif

se nu
syntax on
se tabstop=2

"colorscheme darcula
color monokai


set shiftwidth=4
set expandtab

set smarttab
set smartindent

se incsearch
se hlsearch

set nowrap

execute pathogen#infect()
filetype plugin indent on


set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

set autowrite

set foldmethod=indent
"map <F5> :w \|!cake rebuild<CR>
"imap <F5> <ESC>:w \|!cake rebuild<CR>

