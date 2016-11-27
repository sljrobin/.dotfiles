" tmux.vim: options for tmux
" By Simon L. J. Robin | https://sljrobin.org
"
" This file is a part for '~/.vimrc'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Intercept xterm-style keys when xterm-keys is on
if &term =~ '^screen'
  " <Up> / <Down> / <Right> / <Left>
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
  " <PageUp> / <PageDown>
  execute "set <PageUp>=\e[5;*~"
  execute "set <PageDown>=\e[6;*~"
  " <Home> / <End>
  execute "set <Home>=\e[7;*~"
  execute "set <End>=\e[8;*~"
  " <Insert> / <Delete>
  execute "set <Insert>=\e[2;*~"
  execute "set <Delete>=\e[3;*~"
  " <F1> / ... / <F12> 
  execute "set <F1>=\e[11;*~"
  execute "set <F2>=\e[12;*~"
  execute "set <F3>=\e[13;*~"
  execute "set <F4>=\e[14;*~"
  execute "set <F5>=\e[15;*~"
  execute "set <F6>=\e[17;*~"
  execute "set <F7>=\e[18;*~"
  execute "set <F8>=\e[19;*~"
  execute "set <F9>=\e[20;*~"
  execute "set <F10>=\e[21;*~"
  execute "set <F11>=\e[23;*~"
  execute "set <F12>=\e[24;*~"
endif
