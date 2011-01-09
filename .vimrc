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

let mapleader = ","

" System Copy & Paste prefix
map <silent> <leader><leader> "+
set pastetoggle=<leader>gv

" Toggles
nmap <silent> <leader>gs :set spell!<CR>
nmap <silent> <leader>gn :set number!<CR>
nmap <silent> <leader>gw :set wrap!<CR>
map <F2> :NERDTreeToggle<CR>
map <silent> <leader>g1 :NERDTreeToggle<CR>
map <F3> :TlistToggle<CR>
map <silent> <leader>g2 :TlistToggle<CR>

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

" one-key indentation
nmap > >>
nmap < <<

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

imap <C-a> <Home>
imap <C-e> <End>
imap <C-p> <Esc>ka
imap <C-n> <Esc>ja
imap <C-b> <Esc>i
imap <C-f> <Esc>la
imap <M-b> <Esc>bi
imap <M-f> <Esc>wi

" Easy jumping and selecting over block of code
nmap <Space> %
vmap <Space> %

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

"folding settings
set foldmethod=syntax
set foldnestmax=10
set foldenable
set foldlevel=4
set foldlevelstart=4
nmap <silent> <leader>fi :set foldmethod=indent<CR>
nmap <silent> <leader>fs :set foldmethod=syntax<CR>
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

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

if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC " Source the vimrc file after saving it
    autocmd BufWritePre * :%s/\s\+$//e " remove trailing spaces
    au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod +x <afile> | endif | endif
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

" set par as default formatter
set formatprg=par
nmap <silent> <leader>fp :set formatprg=par

" Command mode shortcut
" map ; :

" open command line window from normal command line mode
set cedit=<C-Q>

" For LISP
let g:lisp_rainbow=1

" Settings for Vim Clojure
let g:clj_highlight_builtins=1
let g:clj_highlight_contrib=1
let g:clj_paren_rainbow=1
