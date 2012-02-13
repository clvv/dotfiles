for config ($HOME/.zsh/*.zsh) source "$config"

[ -s "$HOME/.shenv" ] && source "$HOME/.shenv"
[ -s "$HOME/.aliases" ] && source "$HOME/.aliases"

: # set $? to 0

