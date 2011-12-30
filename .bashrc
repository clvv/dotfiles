if [[ -n "$PS1" ]] ; then

  HISTCONTROL=ignoreboth:erasedupes
  shopt -s histappend
  shopt -s checkwinsize
  HISTSIZE=1000
  HISTFILESIZE=2000

  [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

  if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
  fi

  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

  if shopt -oq posix; then :; else
    if [ -s /etc/bash_completion ]; then
      . /etc/bash_completion
    elif [ -s /usr/local/etc/bash_completion ]; then
      . /usr/local/etc/bash_completion
    fi
  fi

  [ -s "$HOME/.shenv" ] && source "$HOME/.shenv"
  [ -s "$HOME/.aliases" ] && source "$HOME/.aliases"
  _f_bash_hook_cmd_complete c z e m
  _f_bash_hook_word_complete_wrap_all

  [ -s "$HOME/.bashrc.local" ] && source "$HOME/.bashrc.local"

fi

