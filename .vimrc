set nocompatible
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on
syntax on
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set autoindent
set noswapfile
set nobackup
set ruler
set backspace=indent,eol,start
set t_RV=

let mapleader = ","

" System Copy & Paste prefix
map <silent> <leader><leader> "+
set pastetoggle=<leader>gv

" Toggles
map <silent> <leader>gs :set spell!<CR>
map <silent> <leader>gn :set number!<CR>
map <silent> <leader>gw :set wrap!<CR>
map <silent> <leader>g1 :NERDTreeToggle<CR>
map <silent> <leader>g2 :TlistToggle<CR>

" Windows Control
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Tabs Control
map H gT
map L gt
map <silent> <leader>n :tabnew<Cr>
map <silent> <leader>c <C-w>c
map <silent> <leader>q ZQ

" one-key indentation
nmap > >>
nmap < <<

command! Q :q
command! Sw :w !sudo tee %
nmap ZS :w !sudo tee %<CR>
nmap ZW :w<CR>

" display line up/down (not actual)
map <up> gk
map <down> gj

" Some handy Emacs key bindings
cnoremap <C-A>      <Home>
cnoremap <C-B>      <Left>
cnoremap <C-E>      <End>
cnoremap <C-F>      <Right>
cnoremap <C-N>      <Down>
cnoremap <C-J>      <Down>
cnoremap <C-P>      <Up>
cnoremap <C-K>      <Up>
cnoremap <ESC>b     <S-Left>
cnoremap <ESC><C-B> <S-Left>
cnoremap <ESC>f     <S-Right>
cnoremap <ESC><C-F> <S-Right>
cnoremap <ESC><C-H> <C-W>

inoremap <C-A> <Home>
inoremap <C-E> <End>
inoremap <C-K> <Esc>ka
inoremap <C-J> <Esc>ja
inoremap <C-B> <Esc>i
inoremap <C-F> <Esc>la
inoremap <M-o> <C-O>o
inoremap <M-O> <C-O>O
imap <M-b> <Esc>bi
imap <M-f> <Esc>wi

" Easy jumping and selecting over block of code
map <Space> %

" Bubble single lines <S-M-[K,J]>
nmap <Esc>K [e
nmap <Esc>J ]e

" Bubble multiple lines <S-M-[K,J]>
vmap <Esc>K [egv
vmap <Esc>J ]egv

set wildmode=full " :longest
set wildmenu

" Search options
set hlsearch
set incsearch
set ignorecase
set smartcase
nnoremap <C-L> :noh<CR>

"folding settings
"set foldmethod=syntax
"set foldnestmax=10
"set foldenable
"set foldlevel=4
"set foldlevelstart=4
"nmap <silent> <leader>fi :set foldmethod=indent<CR>
"nmap <silent> <leader>fs :set foldmethod=syntax<CR>
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" FuzzyFinder key mappings
nmap <silent> <leader>of :FufFile<CR>
nmap <silent> <leader>oF :FufFileWithCurrentBufferDir<CR>
nmap <silent> <leader>ot :FufTag<CR>
nmap <silent> <leader>oc :FufChangeList<CR>
nmap <silent> <leader>oj :FufJumpList<CR>
nmap <silent> <leader>od :FufDir<CR>

" Lookup tags file up the dir tree
set tags=tags;/
" Tab and Vsplit open tag
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <silent> <leader>] :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

if has("autocmd")
    autocmd FileType tex setlocal wm=2 " Auto wrap tex files
    autocmd bufwritepost .vimrc source $MYVIMRC " Source the vimrc file after saving it
    autocmd BufWritePre * :%s/\s\+$//e " remove trailing spaces
    "au BufWritePost * if getline(1) =~ "^#!" && getline(1) =~ "/bin/" | silent !chmod +x <afile>
endif

if has('gui_running')
    set guioptions=
    set lines=33 columns=100
    set cursorline
    colorscheme lucius
else
    if &t_Co == 256
        set mouse=a " Scrolling in urxvt
        set t_Co=256
        colorscheme lucius
        set cursorline
    endif
    nmap <silent> <leader>c2 :set t_Co=256<CR>
    nmap <silent> <leader>c8 :set t_Co=8<CR>
endif

runtime ftplugin/man.vim

" open command line window from normal command line mode
set cedit=<C-Q>

" For LISP
let g:lisp_rainbow=1

" Settings for Vim Clojure
let vimclojure#HighlightBuiltins=1
let vimclojure#ParenRainbow=1

" YankRing
let g:yankring_history_file = '.yankring'
