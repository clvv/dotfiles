for config ($HOME/.zsh/*.zsh) source "$config"

{ # Compile the completion dump to increase startup speed.
  dump_file="$HOME/.zcompdump"
  if [[ "$dump_file" -nt "${dump_file}.zwc" || ! -f "${dump_file}.zwc" ]]; then
    zcompile "$dump_file"
  fi
  unset dump_file
} &!

# Load and initialize the completion system ignoring insecure directories.
autoload -Uz compinit && compinit -i

FASD_CACHE="$HOME/.fasd-init-zsh"

if [ "${commands[fasd]}" -nt "$FASD_CACHE" -o ! -f "$FASD_CACHE" ]; then
  fasd --init posix-alias zsh-{hook,ccomp,ccomp-install,wcomp,wcomp-install} \
    >! "$FASD_CACHE"
fi

if [ -e "$HOME/lib/zsh-yarn-completions/zsh-yarn-completions.plugin.zsh" ]; then
  source "$HOME/lib/zsh-yarn-completions/zsh-yarn-completions.plugin.zsh"
fi

source "$FASD_CACHE"

: # set $? to 0

