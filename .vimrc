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

" Settings {{{
filetype plugin indent on
syntax on
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set smarttab
set autoindent
set autoread
set autowrite
set nobackup
set noswapfile
set ruler
set backspace=indent,eol,start
set listchars=tab:\|_
set wildmode=full
set wildmenu
if v:version >= 703
  set undofile
  set undodir=~/.vim/undo
  if has("nvim-0.5.0")
    set undodir=~/.config/nvim/undo
  endif
else
  set t_RV=
endif
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif
set noerrorbells
set vb t_vb=

let g:tex_flavor = "latex"
let mapleader = ','

" Search settings {{{
set hlsearch
set incsearch
set ignorecase
set smartcase
" }}}

" Plugin options "{{{

" For LISP
let g:lisp_rainbow=1

" Settings for Vim Clojure
let vimclojure#HighlightBuiltins=1
let vimclojure#ParenRainbow=1

" SuperTab
let g:SuperTabDefaultCompletionType = 'context'

" DelimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" Tagbar
let g:tagbar_left = 1
let g:tagbar_compact = 1
let g:tagbar_width = 30
let g:tagbar_expand = 1

" NerdTree
let g:NERDTreeWinPos = 'right'

" JSLint.vim
let g:JSLintHighlightErrorLine = 0
"   }}}
" }}}

" Mappings {{{
" Toggles {{{
map <silent> <leader>gl :set list!<CR>
map <silent> <leader>gn :set number!<CR>
if v:version >= 703
  map <silent> <leader>gr :set relativenumber!<CR>
endif
map <silent> <leader>gs :set spell!<CR>
map <silent> <leader>gw :set wrap!<CR>
map <silent> <leader>g1 :NERDTreeToggle<CR>
map <silent> <leader>g2 :TagbarToggle<CR>
"   }}}

" Windows Control {{{
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
"   }}}

" Tabs Control {{{
map H gT
map L gt
map <silent> <leader>n :tabnew<Cr>
map <silent> <leader>c <C-w>c
map <silent> <leader>q ZQ
"   }}}

" System Copy & Paste prefix {{{
map <silent> <leader><leader> "+
set pastetoggle=<leader>gv
"   }}}

" Indentation {{{
nmap > >>
nmap < <<
vmap > >gv
vmap < <gv
"   }}}

" Handy Emacs key bindings {{{
cnoremap <C-A>      <Home>
cnoremap <C-B>      <Left>
cnoremap <C-E>      <End>
cnoremap <C-F>      <Right>
cnoremap <ESC>j     <Down>
cnoremap <ESC>k     <Up>
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
"   }}}

" Misc {{{
set cedit=<C-Q> " open command line window from normal command line mode

" Easy jumping and selecting over block of code
map <Space> %

" display line up/down (not actual)
map <Up> gk
map <Down> gj

" <S-M-L> to clear highlights
nmap <ESC>L :noh<CR>

vmap <leader>T :Tabularize /
nmap <leader>T :Tabularize /

nmap <silent> <leader>m :make<CR><CR><CR>

command! -bang Q :q<bang>
nmap ZS :SudoWrite<CR>
nmap ZW :w<CR>
nmap zW <Nop>
"   }}}

" }}}

" Features {{{
" Folding {{{
set foldmethod=marker
set foldenable
"set foldlevel=4
"set foldlevelstart=4
nmap <silent> <leader>oi :set foldmethod=indent<CR>
nmap <silent> <leader>os :set foldmethod=syntax<CR>
nmap <silent> <leader>om :set foldmethod=marker<CR>
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo
"   }}}

" Ctag {{{
" Lookup tags file up the dir tree
set tags=tags;~
" Tab and Vsplit open tag
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <silent> <leader>] :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"   }}}
" }}}

" Autocmd {{{
if has("autocmd")
  autocmd BufWritePre * :%s/\s\+$//e " remove trailing spaces
  autocmd BufNewFile,BufRead *.json set ft=javascript
  augroup VIMRC " {{{
    autocmd!
    autocmd BufWritePost .vimrc source $MYVIMRC
  augroup END " }}}
  autocmd FileType *commit* setlocal spell
  autocmd FileType tex silent! compiler tex | setlocal tw=78 makeprg=pdflatex\
        \ -interaction=nonstopmode\ %
  autocmd BufNewFile,BufRead *.1.md setlocal tw=78 makeprg=pandoc\ -s\ -w\
        \ man\ %\ -o\ %<
  autocmd FileType make,snippet,snippets,autohotkey setlocal list ts=8 sw=8 sts=8 noet
  autocmd FileType make,snippet,snippets setlocal list ts=8 sw=8 sts=8 noet
  autocmd FileType python,lua setlocal ts=4 sw=4 sts=4 et
  autocmd FileType vim let b:delimitMate_matchpairs = "(:),[:],{:},<:>"
  autocmd FileType lisp,scheme,clojure let b:delimitMate_quotes = '"'
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown
endif " }}}

" Styling {{{
if has('gui_running')
  set guioptions=
  set cursorline
  LuciusBlack
  colorscheme lucius
else
  if &t_Co == 256
    set mouse=a " Scrolling in urxvt
    colorscheme lucius
    set cursorline
    LuciusBlack
    set t_ut= " Background
  endif
  nmap <silent> <leader>c2 :set t_Co=256<CR>
  nmap <silent> <leader>c8 :set t_Co=8<CR>
endif " }}}

" Helpers {{{
" runtime ftplugin/man.vim
runtime macros/matchit.vim

" Stab, tab and space settings helper {{{
" Calling Stab with no arguments will print current tab and space settings
" Calling Stab with a number will set ts, sw and sts to that number
" Trailing ! will set expandtab, and trailing ? will set noexpandtab
command! -nargs=? Stab call Stab(<f-args>)
function! Stab(...)
  if a:0 != 0
    if a:1 =~ '!'
      set expandtab
    elseif a:1 =~ '?'
      set noexpandtab
    endif
    if a:1 > 0
      let l:tabstop = 1 * a:1
      let &l:sts = l:tabstop
      let &l:ts = l:tabstop
      let &l:sw = l:tabstop
    endif
  endif
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction " }}}

" Z - cd to recent / frequent directories {{{
command! -nargs=* Z :call Z(<f-args>)
function! Z(...)
  if a:0 == 0
    let list = split(system('fasd -dlR'), '\n')
    let path = tlib#input#List('s', 'Select one', list)
  else
    let cmd = 'fasd -d -e printf'
    for arg in a:000
      let cmd = cmd . ' ' . arg
    endfor
    let path = system(cmd)
  endif
  if isdirectory(path)
    echo path
    exec 'cd ' . path
  endif
endfunction " }}}

" <Leader>z - quick spelling correction {{{
nmap <silent> <leader>z :QuickSpellingFix<CR>
command! QuickSpellingFix call QuickSpellingFix()
function! QuickSpellingFix()
  if &spell
    normal 1z=
  else
    set spell
    normal 1z=
    set nospell
  endif
endfunction " }}}
" }}}

" Source .vimrc.local if present {{{
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif " }}}
" vim:set ft=vim et sw=2:
