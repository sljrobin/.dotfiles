" plugins.vim: settings for plugins
" By Simon L. J. Robin | https://sljrobin.org
"
" This file is a part for '~/.vimrc'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indentLine
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" * `indentLine_char`       -> Character to use for delimitation
" * `indentLine_color_term` -> Color of the character
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char = '|'
let g:indentLine_color_term = 236


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" * `NERDTreeShowHidden` -> Show/Hide hidden files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeShowHidden=1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" * `UltiSnipsEditSplit`           -> Window mode for editing snippets
" * `UltiSnipsExpandTrigger`       -> Character to expand a snippet
" * `UltiSnipsJumpBackwardTrigger` -> Character to cycle backwards snippets
" * `UltiSnipsJumpForwardTrigger`  -> Character to cycle forwards snippets
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-p>"
let g:UltiSnipsJumpForwardTrigger="<C-n>"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-multiple-cursors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" * `multi_cursor_exit_from_insert_mode` -> Delete cursors in Insert mode
" * `multi_cursor_exit_from_visual_mode` -> Delete cursors in Visual mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_exit_from_insert_mode=0
let g:multi_cursor_exit_from_visual_mode=0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" * `ycm_key_list_previous_completion`    -> Character to cycle backwards
"                                            through the completion list
" * `ycm_key_list_select_completion`      -> Character to cycle fowards through
"                                            the completion list
" * `ycm_min_num_of_chars_for_completion` -> Number of characters needed to be
"                                            typed before completion
"                                            suggestions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
let g:ycm_min_num_of_chars_for_completion=2
