" Plugins {{{
call plug#begin('~/.vim/plugged')

" IDE: Coc, Conquer of completion
" Requires nodejs: curl -sL install-node.now.sh/lts | bash
Plug 'neoclide/coc.nvim', {'branch': 'release',
            \ 'for': 'rust', 'do': ':CocInstall coc-rust-analyzer'
            \ }
autocmd! User coc.nvim source ~/.config/nvim/coc.vim

" Theme:
Plug 'jonathanfilip/vim-lucius'

" Commands:
Plug 'mileszs/ack.vim', { 'on': 'Ack' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'preservim/tagbar', { 'on': 'TagbarToggle' }
Plug 'tpope/vim-fugitive', { 'on': ['G', 'Git'] }
Plug 'tpope/vim-eunuch'

" Edit:
Plug 'Raimondi/delimitMate'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'

" Other:
Plug 'vim-scripts/IndexedSearch'
Plug 'vim-scripts/ZoomWin'
Plug 'bogado/file-line'

call plug#end()
" }}}

source ~/.vimrc.common
" vim:set ft=vim et sw=2:
