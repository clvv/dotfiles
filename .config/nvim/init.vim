set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

if has("nvim-0.6.0")
  nnoremap Y yy
endif

source ~/.vimrc
" vim:set ft=vim et sw=2:
