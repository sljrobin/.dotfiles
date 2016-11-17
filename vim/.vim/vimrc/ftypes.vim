" ftypes.vim: options for filetypes
" By Simon L. J. Robin | https://sljrobin.org
"
" This file is a part for '~/.vimrc'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HTML
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufReadPost *.htm set filetype=html  " `*.htm`


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufReadPost *.md    set filetype=markdown  " `*.md`
autocmd BufNewFile,BufReadPost *.mkd   set filetype=markdown  " `*.mkd`
autocmd BufNewFile,BufReadPost *.mkdn  set filetype=markdown  " `*.mkdn`
autocmd BufNewFile,BufReadPost *.mdown set filetype=markdown  " `*.mdown`


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ruby
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufReadPost Gemfile  set filetype=ruby  " `Gemfile`
autocmd BufNewFile,BufReadPost Rakefile set filetype=ruby  " `Rakefile`


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sass/SCSS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufReadPost *.sass set filetype=css  " `*.sass`
autocmd BufNewFile,BufReadPost *.scss set filetype=css  " `*.scss`


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shell
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufReadPost .bash_history set filetype=sh  " `.bash_history`
autocmd BufNewFile,BufReadPost .bash_logout  set filetype=sh  " `.bash_logout`
autocmd BufNewFile,BufReadPost .bashrc       set filetype=sh  " `.bashrc`
autocmd BufNewFile,BufReadPost .rtorrent.rc  set filetype=sh  " `.rtorrent.rc`


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufReadPost .vimrc set filetype=vim  " `.vimrc`


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YAML
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufReadPost *.yml set filetype=yaml  " `*.yml`
