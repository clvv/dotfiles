bindkey -e
bindkey -s '^[l' 'ls'
bindkey -s '^[>' '..'
bindkey '^r' history-incremental-search-backward
bindkey '^[[5~' up-line-or-history
bindkey '^[[6~' down-line-or-history

bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

bindkey '^[[H' beginning-of-line
bindkey '^[[1~' beginning-of-line
bindkey '^[[F'  end-of-line
bindkey '^[[4~' end-of-line
bindkey ' ' magic-space

bindkey '^[[Z' reverse-menu-complete

bindkey '^[[3~' delete-char
bindkey '^[3;5~' delete-char
bindkey '\e[3~' delete-char

bindkey '^[m' copy-prev-shell-word
bindkey '^[.' insert-last-word

bindkey '^K' history-beginning-search-backward
bindkey '^J' history-beginning-search-forward
bindkey '^[^I' _history-complete-older
bindkey '^[^[^I' _history-complete-newer

# Quick jumping to n-th arguments by pressing Alt-number
bindkey '^[1' beginning-of-line
bindkey -s '^[2' 'f'
bindkey -s '^[3' 'ff'
bindkey -s '^[4' 'fff'
bindkey -s '^[5' 'ffff'
bindkey -s '^[6' 'fffff'
bindkey -s '^[7' 'ffffff'
bindkey -s '^[8' 'fffffff'
bindkey -s '^[9' 'ffffffff'

