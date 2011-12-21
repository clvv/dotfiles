bindkey -e
bindkey '^R' history-incremental-search-backward
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

bindkey '^K' history-beginning-search-backward
bindkey '^J' history-beginning-search-forward
bindkey '^[k' history-beginning-search-backward
bindkey '^[j' history-beginning-search-forward
#bindkey '^I' menu-expand-or-complete
bindkey '^[^I' _history-complete-older
bindkey '^[^[^I' _history-complete-newer

bindkey -s '^[l' '^Qls^M' # Alt-l
bindkey -s '^[>' '^Q..^M' # Alt-S-.
bindkey -s '^[-' '^Qcd -^M'
bindkey -s '^[S' '^Asudo ^E' # Alt-S-s add sudo

# Quick jumping to n-th arguments by pressing Alt-number
bindkey '^[1' beginning-of-line
bindkey -s '^[2' '^A^[f'
bindkey -s '^[3' '^A^[f^[f'
bindkey -s '^[4' '^A^[f^[f^[f'
bindkey -s '^[5' '^A^[f^[f^[f^[f'
bindkey -s '^[6' '^A^[f^[f^[f^[f^[f'
bindkey -s '^[7' '^A^[f^[f^[f^[f^[f^[f'
bindkey -s '^[8' '^A^[f^[f^[f^[f^[f^[f^[f'
bindkey -s '^[9' '^A^[f^[f^[f^[f^[f^[f^[f^[f'

bindkey '^X^A' f-complete
bindkey '^X^F' f-complete-f
bindkey '^X^D' f-complete-d

