" bars.vim: options for status bar, command bar, wild menu
" By Simon L. J. Robin | https://sljrobin.org
"
" This file is a part for '~/.vimrc'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status bar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showmode      " Show the current mode
set laststatus=2  " Print the last status
set ruler                           " Enable ruler
"set rulerformat=(%c%V%)

" %l line
" "%c characters
" %P percentage

"set virtualedit=block
"set statusline+=%y        " Filetype of the file


set rulerformat=%l,%v


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command bar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showcmd      " Show command in bottom bar
set cmdheight=1  " Command bar height


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Wild menu
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("wildmenu")                " Check for compatibility
  set wildignore+=*.a             " Ignore `*.a` files
  set wildignore+=*.bak,*.bmp     " Ignore `*.bak`, `*.bmp` files
  set wildignore+=*.class         " Ignore `*.class` files
  set wildignore+=*.gif           " Ignore `*.gif` files
  set wildignore+=*.hi            " Ignore `*.hi` files
  set wildignore+=*.ico           " Ignore `*.ico` files
  set wildignore+=*.jpg,*.jpeg    " Ignore `*.jpg`, `*.jpeg` files
  set wildignore+=*.o             " Ignore `*.o` files
  set wildignore+=*.png,*.pyc     " Ignore `*.png`, `*.pyc` files
  set wildignore+=*.swp           " Ignore `*.swp` files
  set wildignore+=*.tmp           " Ignore `*.tmp` files
  set wildignore+=*~              " Ignore `*~` files
  set wildignore+=.DS_Store       " Ignore `.DS_Store` files
  set wildignore+=.git            " Ignore `.git` files
  set wildignore+=.hg             " Ignore `.hg` files
  set wildignore+=.svn            " Ignore `.svn` files
  set wildmenu                    " Enhance command line completion
  set wildmode=longest:full,full  " Complete the longest part, then switch
endif
