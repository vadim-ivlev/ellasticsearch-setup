
if $TERM == "xterm-256color"
  set t_Co=256
endif

se nu
syntax on
se tabstop=2

color darcula
"color evening


set shiftwidth=2
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

"set autowriteall=on
set autowrite


"map <F5> :w \|!cake rebuild<CR> 
""imap <F5> <ESC>:w \|!cake rebuild<CR>

"switching buffers
nmap <C-N> :bn<CR>
nmap <C-P> :bp<CR>i

" folding
set foldmethod=manual
set foldmethod=manual
autocmd BufWinLeave *.* mkview!
autocmd BufWinEnter *.* silent loadview
