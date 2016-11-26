" theme.vim: options for colorscheme
" By Simon L. J. Robin | https://sljrobin.org
"
" This file is a part for '~/.vimrc'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Initialization
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shortmess+=I  " Hide the launch screen
set t_Co=256      " Enable 256 colors
syntax on         " Enable syntax highlighting


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Base16
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" If 'Base16' colorscheme exists, load it
if filereadable(expand("$HOME/.vim/bundle/base16-vim/colors/base16-default-dark.vim"))
  let base16colorspace=256         " Access colors present in 256 colorspace
  colorscheme base16-default-dark  " Load 'base16-default-dark'
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark    " Color the background 
set conceallevel=0
set cursorline         " Highlight the current line
set number             " Enable line numbers
set numberwidth=4      " Line numbers column width
set showmatch          " Highlight matching brackets
set foldcolumn=1       " Fold Column width
set foldmethod=indent  " Indentation used for the kind of folding
set splitbelow         " Open new window below the current window for hsplit
set splitright         " Open new window right the current window for vsplit
