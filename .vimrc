set nocompatible
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on
syntax on
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set autoindent
set ruler

let mapleader = ","

" Copy & Paste
map <silent> <leader>y "+y
map <silent> <leader>p "+gp

" Windows Control
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nmap <silent> <leader>h <C-w>h
nmap <silent> <leader>j <C-w>j
nmap <silent> <leader>k <C-w>k
nmap <silent> <leader>l <C-w>l

" Tabs Control
map <A-[> gT
map <A-]> gt
map <S-h> gT
map <S-l> gt
nmap <C-t> :tabnew<CR>
map! <C-t> <Esc>:tabnew<CR>

map <F2> :NERDTreeToggle<CR>
map <F3> :TlistToggle<CR>

" Search options
set hlsearch
set incsearch
set ignorecase
set smartcase

" display line up/down (not actual)
map <up> gk
map <down> gj

nmap <silent> <leader>s :set spell!<CR>
nmap <silent> <leader>n :set number!<CR>
nmap <silent> <leader>w :set wrap!<CR>
set wildmode=longest:full
set wildmenu

" Source the vimrc file after saving it
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

if has('gui_running')
    set guioptions=r
    set lines=33 columns=100
endif

" one-key indentation
nmap > >>
nmap < <<

command! Sw :w !sudo tee %

" Settings for Vim Clojure
let g:clj_highlight_builtins=1      " Highlight Clojure's builtins
let g:clj_paren_rainbow=1           " Rainbow parentheses'!

:au BufReadPost * if b:current_syntax == "lisp"
:au BufReadPost * call rainbow_parenthsis#LoadRound ()
:au BufReadPost * call rainbow_parenthsis#Activate ()
:au BufReadPost * endif
