" indent.vim: options for visual/real indentation
" By Simon L. J. Robin | https://sljrobin.org
"
" This file is a part for '~/.vimrc'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Main options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab                   " Insert spaces instead of tabs
set tabstop=4                   " Number of spaces for a tabulation
set shiftwidth=4                " Number of spaces for a reindent operation
set autoindent                  " Turn on auto indentation
set wrap                        " Enable wrapping
set linebreak                   " Allow linebreaks
set backspace=indent,eol,start  " Enable correct backspacing


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetypes indentations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType c          setlocal shiftwidth=4 tabstop=4  " `*.c`
autocmd FileType cpp        setlocal shiftwidth=2 tabstop=2  " `*.cpp`
autocmd FileType css        setlocal shiftwidth=2 tabstop=2  " `*.css`
autocmd FileType cls        setlocal shiftwidth=2 tabstop=2  " `*.cls`
autocmd FileType go         setlocal shiftwidth=2 tabstop=2  " `*.go`
autocmd FileType haskell    setlocal shiftwidth=4 tabstop=4  " `*.hs`
autocmd FileType html       setlocal shiftwidth=2 tabstop=2  " `*.html`
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2  " `*.js`
autocmd FileType json       setlocal shiftwidth=2 tabstop=2  " `*.json`
autocmd FileType markdown   setlocal shiftwidth=4 tabstop=4  " `*.md`
autocmd FileType plaintex   setlocal shiftwidth=2 tabstop=2  " `*.plaintex`
autocmd FileType ruby       setlocal shiftwidth=2 tabstop=2  " `*.rb`
autocmd FileType sh         setlocal shiftwidth=2 tabstop=2  " `*.sh`
autocmd FileType tex        setlocal shiftwidth=2 tabstop=2  " `*.tex`
autocmd FileType vim        setlocal shiftwidth=2 tabstop=2  " `*.vim`
autocmd FileType xml        setlocal shiftwidth=2 tabstop=2  " `*.xml`
autocmd FileType yaml       setlocal shiftwidth=2 tabstop=2  " `*.yaml`
autocmd FileType zsh        setlocal shiftwidth=2 tabstop=2  " `*.zsh`
