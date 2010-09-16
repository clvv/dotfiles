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

let mapleader = ","

" Copy & Paste
map <silent> <leader>y "+y
map <silent> <leader>p "+gp
set pastetoggle=<leader>v

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
nmap <silent> <leader>t :tabnew<Cr>
"nmap <C-t> :tabnew<CR>
"map! <C-t> <Esc>:tabnew<CR>

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

imap <C-a> <Esc>0i
imap <C-e> <Esc>$a
imap <M-b> <Esc>bi
imap <M-f> <Esc>wi

nmap <silent> <leader>s :set spell!<CR>
nmap <silent> <leader>n :set number!<CR>
nmap <silent> <leader>w :set wrap!<CR>
set wildmode=longest:full
set wildmenu

"folding settings
set foldmethod=indent
set foldnestmax=10
set foldenable
set foldlevel=1
set foldlevelstart=1
nmap <silent> <leader>fi :set foldmethod=indent<CR>
nmap <silent> <leader>fs :set foldmethod=syntax<CR>

" FuzzyFinder key mappings
nmap <silent> <leader>ff :FufFile<CR>
nmap <silent> <leader>fF :FufFileWithCurrentBufferDir<CR>
nmap <silent> <leader>ft :FufTag<CR>
nmap <silent> <leader>fc :FufChangeList<CR>
nmap <silent> <leader>fj :FufJumpList<CR>
nmap <silent> <leader>fd :FufDir<CR>

" Lookup tags file up the dir tree
set tags=tags;/
" Tab and Vsplit open tag
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <silent> <leader>] :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Source the vimrc file after saving it
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

if has('gui_running')
    set guioptions=r
    set lines=33 columns=100
    set cursorline
    colorscheme lucius
else
    if ( $TERM =~ "xterm" && !( $TMUX =~ "tmux" ) && !( $TERMCAP =~"screen" ) )
        set t_Co=256
        colorscheme lucius
    endif
    nmap <silent> <leader>c2 :set t_Co=256<CR>
    nmap <silent> <leader>c8 :set t_Co=8<CR>
endif


" Command mode shortcut
nmap ; :

" one-key indentation
nmap > >>
nmap < <<

command! Sw :w !sudo tee %

" For LISP
let g:lisp_rainbow=1

" Settings for Vim Clojure
let g:clj_highlight_builtins=1
let g:clj_highlight_contrib=1
let g:clj_paren_rainbow=1

