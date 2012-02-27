for config ($HOME/.zsh/*.zsh) source "$config"

# Compile the completion dump, to increase startup speed.
dump_file="$HOME/.zcompdump"
if [[ "$dump_file" -nt "${dump_file}.zwc" || ! -f "${dump_file}.zwc" ]]; then
  zcompile "$dump_file"
fi
unset dump_file

[ -s "$HOME/.shenv" ] && source "$HOME/.shenv"
[ -s "$HOME/.aliases" ] && source "$HOME/.aliases"

: # set $? to 0

