if [ "$PS1" ]; then

  HISTCONTROL=ignoreboth:erasedupes
  shopt -s histappend
  shopt -s checkwinsize
  HISTSIZE=1000
  HISTFILESIZE=2000

  PS1='\[\e[0;32m\][\u \h] \[\e[0;33m\][\W$(_gb)] \[\e[0;31m\]\$\[\e[39m\] '

  if shopt -oq posix; then :; else
    if [ -s /etc/bash_completion ]; then
      . /etc/bash_completion
    elif [ -s /usr/local/etc/bash_completion ]; then
      . /usr/local/etc/bash_completion
    fi
  fi

  [ -s "$HOME/.shenv" ] && source "$HOME/.shenv"
  [ -s "$HOME/.aliases" ] && source "$HOME/.aliases"
  eval "$(fasd --init-bash)"
  _fasd_bash_hook_cmd_complete z e m
  _fasd_bash_hook_word_complete_wrap_all

  [ -s "$HOME/.bashrc.local" ] && source "$HOME/.bashrc.local"

fi

