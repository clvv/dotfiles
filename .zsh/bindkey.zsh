bindkey -e
bindkey '\ew' kill-region
bindkey -s '\el' "ls"
bindkey -s '\e.' ".."
bindkey '^r' history-incremental-search-backward
bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history

bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

bindkey "^[[H" beginning-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[[F"  end-of-line
bindkey "^[[4~" end-of-line
bindkey ' ' magic-space

bindkey '^[[Z' reverse-menu-complete

bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char
bindkey "\e[3~" delete-char

bindkey "^[m" copy-prev-shell-word

bindkey "^K" history-beginning-search-backward
bindkey "^J" history-beginning-search-forward
bindkey "^[^I" _history-complete-older
bindkey "^[^[^I" _history-complete-newer

