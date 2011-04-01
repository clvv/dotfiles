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

    if [ -f ~/.aliases ]; then
        . ~/.aliases
    fi

    if [ "$COLORTERM" == "gnome-terminal" ]; then
        export TERM="xterm-256color"
    fi

    if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
        . /etc/bash_completion
    fi

    [ -s "$HOME/.shenv" ] && source $HOME/.shenv

    if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
        source "$HOME/.rvm/scripts/rvm"
    elif [[ -s "/usr/local/rvm/scripts/rvm" ]]; then
        source "/usr/local/rvm/scripts/rvm"
    fi

    [ -s "$HOME/lib/z/z.sh" ] && source $HOME/lib/z/z.sh

    [ -s "$HOME/.bashrc.local" ] && source $HOME/.bashrc.local

fi

