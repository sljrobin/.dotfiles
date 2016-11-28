" vundle.vim: load plugins
" By Simon L. J. Robin | https://sljrobin.org
"
" This file is a part for '~/.vimrc'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Initialization
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                   " Do not let Vim starts its initializations
filetype off                       " Unable file type detection
set rtp+=~/.vim/bundle/Vundle.vim  " Set the RunTimePath
call vundle#begin()                " Begin Vundle


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'VundleVim/Vundle.vim'          " Plugin: Vundle
Plugin 'chriskempson/base16-vim'       " Plugin: Base16
Plugin 'scrooloose/nerdtree'           " Plugin: NERDTree
Plugin 'Raimondi/delimitMate'          " Plugin: delimitMate
Plugin 'terryma/vim-multiple-cursors'  " Plugin: vim-multiple-cursors
Plugin 'easymotion/vim-easymotion'     " Plugin: EasyMotion
Plugin 'Yggdroot/indentLine'           " Plugin: indentLine
Plugin 'Valloric/YouCompleteMe'        " Plugin: YouCompleteMe
Plugin 'majutsushi/tagbar'             " Plugin: Tagbar
Plugin 'SirVer/ultisnips'              " Plugin: UltiSnips
Plugin 'honza/vim-snippets'            " Plugin: vim-snippets


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call vundle#end()   " End Vundle
filetype plugin on  " Enable the plugin files for specific file types
filetype indent on  " Enable the indent file for specific file types
