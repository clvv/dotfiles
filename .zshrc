for config ($HOME/.zsh/*.zsh) source "$config"

# Compile the completion dump, to increase startup speed.
dump_file="$HOME/.zcompdump"
if [[ "$dump_file" -nt "${dump_file}.zwc" || ! -f "${dump_file}.zwc" ]]; then
  zcompile "$dump_file"
fi
unset dump_file

# Load and initialize the completion system ignoring insecure directories.
autoload -Uz compinit && compinit -i

[ -s "$HOME/.shenv" ] && source "$HOME/.shenv"
[ -s "$HOME/.aliases" ] && source "$HOME/.aliases"

FASD_CACHE="$HOME/.fasd-init-zsh"

if test-nt "$(which fasd)" "$FASD_CACHE" || [ ! -f "$FASD_CACHE" ]; then
  fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp \
    zsh-wcomp-install > "$FASD_CACHE"
fi

source "$FASD_CACHE"

: # set $? to 0

