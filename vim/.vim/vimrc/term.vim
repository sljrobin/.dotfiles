" term.vim: options for vim within a terminal
" By Simon L. J. Robin | https://sljrobin.org
"
" This file is a part for '~/.vimrc'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set lazyredraw                  " Better performance when executing macros
set noerrorbells                " No error sounds
set nolist                      " Do not show invisible characters by default
set scrolloff=20                " Number of lines above and below the cursor
set title                       " Change the terminal's title
set titleold=                   " Do not show 'Thanks' message when leaving vim
set ttyfast                     " Fast terminal
set ttymouse=sgr                " Select beyond 222 columns with the mouse
set visualbell                  " No error sounds
autocmd VimResized * :wincmd =  " Automatically resize the windows inside vim
