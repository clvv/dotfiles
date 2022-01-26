" Plugins {{{
call plug#begin('~/.vim/plugged')

" IDE: Coc, Conquer of completion. Requires nodejs.
Plug 'neoclide/coc.nvim', {'branch': 'release',
            \ 'for': ['rust', 'tex', 'markdown'], 'on': 'CocInfo',
            \ 'do': ':CocInstall coc-rust-analyzer coc-ltex',
            \ }
autocmd! User coc.nvim source ~/.config/nvim/coc.vim

" Theme:
Plug 'clvv/vim-lucius'

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

" Language:
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" Other:
Plug 'vim-scripts/IndexedSearch'
Plug 'bogado/file-line'

call plug#end()
" }}}

source ~/.vimrc.common
" vim:set ft=vim et sw=2:
