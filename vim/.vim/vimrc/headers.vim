" headers.vim: headers for different types of files
" By Simon L. J. Robin | https://sljrobin.org
"
" This file is a part for '~/.vimrc'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bash (`*.sh`)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(expand("$HOME/.vim/headers/sh"))
  autocmd BufNewFile *.sh so $HOME/.vim/headers/sh
  autocmd BufNewFile *.sh exe "1," . 9 . "g/Filename:.*/s//Filename: " .expand("%")
  autocmd BufNewFile *.sh exe "1," . 9 . "g/Created:.*/s//Created: " .strftime("%Y-%m-%d %H:%M:%S")
  autocmd Bufwritepre,filewritepre *.sh execute "normal ma" 
  autocmd Bufwritepre,filewritepre *.sh exe "1," . 9 . "g/Modified:.*/s/Modified:.*/Modified: " .strftime("%Y-%m-%d %H:%M:%S") 
  autocmd Bufwritepost,filewritepost *.sh execute "normal `a" 
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" (`*.c`)
if filereadable(expand("$HOME/.vim/headers/c"))
  autocmd BufNewFile *.c so $HOME/.vim/headers/c
  autocmd BufNewFile *.c exe "1," . 12 . "g/Filename:.*/s//Filename: " .expand("%")
  autocmd BufNewFile *.c exe "1," . 12 . "g/Created:.*/s//Created: " .strftime("%Y-%m-%d %H:%M:%S")
  autocmd Bufwritepre,filewritepre *.c execute "normal ma" 
  autocmd Bufwritepre,filewritepre *.c exe "1," . 12 . "g/Modified:.*/s/Modified:.*/Modified: " .strftime("%Y-%m-%d %H:%M:%S") 
  autocmd Bufwritepost,filewritepost *.c execute "normal `a" 
endif

" (`*.h`)
if filereadable(expand("$HOME/.vim/headers/c"))
  autocmd BufNewFile *.h so $HOME/.vim/headers/c
  autocmd BufNewFile *.h exe "1," . 12 . "g/Filename:.*/s//Filename: " .expand("%")
  autocmd BufNewFile *.h exe "1," . 12 . "g/Created:.*/s//Created: " .strftime("%Y-%m-%d %H:%M:%S")
  autocmd Bufwritepre,filewritepre *.h execute "normal ma" 
  autocmd Bufwritepre,filewritepre *.h exe "1," . 12 . "g/Modified:.*/s/Modified:.*/Modified: " .strftime("%Y-%m-%d %H:%M:%S") 
  autocmd Bufwritepost,filewritepost *.h execute "normal `a" 
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C++
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" (`*.cpp`)
if filereadable(expand("$HOME/.vim/headers/cpp"))
  autocmd BufNewFile *.cpp so $HOME/.vim/headers/cpp
  autocmd BufNewFile *.cpp exe "1," . 12 . "g/Filename:.*/s//Filename: " .expand("%")
  autocmd BufNewFile *.cpp exe "1," . 12 . "g/Created:.*/s//Created: " .strftime("%Y-%m-%d %H:%M:%S")
  autocmd Bufwritepre,filewritepre *.cpp execute "normal ma" 
  autocmd Bufwritepre,filewritepre *.cpp exe "1," . 12 . "g/Modified:.*/s/Modified:.*/Modified: " .strftime("%Y-%m-%d %H:%M:%S") 
  autocmd Bufwritepost,filewritepost *.cpp execute "normal `a" 
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python (`*.py`)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(expand("$HOME/.vim/headers/py"))
  autocmd BufNewFile *.py so $HOME/.vim/headers/py
  autocmd BufNewFile *.py exe "1," . 10 . "g/Filename:.*/s//Filename: " .expand("%")
  autocmd BufNewFile *.py exe "1," . 10 . "g/Created:.*/s//Created: " .strftime("%Y-%m-%d %H:%M:%S")
  autocmd Bufwritepre,filewritepre *.py execute "normal ma" 
  autocmd Bufwritepre,filewritepre *.py exe "1," . 10 . "g/Modified:.*/s/Modified:.*/Modified: " .strftime("%Y-%m-%d %H:%M:%S") 
  autocmd Bufwritepost,filewritepost *.py execute "normal `a" 
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TeX (`*.tex`)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(expand("$HOME/.vim/headers/tex"))
  autocmd BufNewFile *.tex so $HOME/.vim/headers/tex
  autocmd BufNewFile *.tex exe "1," . 6 . "g/Filename:.*/s//Filename: " .expand("%")
  autocmd BufNewFile *.tex exe "1," . 6 . "g/Created:.*/s//Created: " .strftime("%Y-%m-%d %H:%M:%S")
  autocmd Bufwritepre,filewritepre *.tex execute "normal ma" 
  autocmd Bufwritepre,filewritepre *.tex exe "1," . 6 . "g/Modified:.*/s/Modified:.*/Modified: " .strftime("%Y-%m-%d %H:%M:%S") 
  autocmd Bufwritepost,filewritepost *.tex execute "normal `a" 
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Zsh (`*.zsh`)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(expand("$HOME/.vim/headers/zsh"))
  autocmd BufNewFile *.zsh so $HOME/.vim/headers/zsh
  autocmd BufNewFile *.zsh exe "1," . 9 . "g/Filename:.*/s//Filename: " .expand("%")
  autocmd BufNewFile *.zsh exe "1," . 9 . "g/Created:.*/s//Created: " .strftime("%Y-%m-%d %H:%M:%S")
  autocmd Bufwritepre,filewritepre *.zsh execute "normal ma" 
  autocmd Bufwritepre,filewritepre *.zsh exe "1," . 9 . "g/Modified:.*/s/Modified:.*/Modified: " .strftime("%Y-%m-%d %H:%M:%S") 
  autocmd Bufwritepost,filewritepost *.zsh execute "normal `a" 
endif
