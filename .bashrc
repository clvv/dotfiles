if [[ -n "$PS1" ]] ; then

    HISTCONTROL=ignoredups:ignorespace
    shopt -s histappend
    shopt -s checkwinsize
    HISTSIZE=1000
    HISTFILESIZE=2000

    [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

    if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
        debian_chroot=$(cat /etc/debian_chroot)
    fi

    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

    if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
    fi

    if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
        . /etc/bash_completion
    fi

    export PATH=$PATH:$HOME/bin:$HOME/android-sdk-linux_86/tools:$HOME/android-cm/out/host/linux-x86/bin:$HOME/arm-toolchain/bin
    export PATH=$PATH:$HOME/google_appengine
    export EDITOR=vim
    export PAGER=less

    export CLOJURE_EXT=~/.clojure
    export PATH=$PATH:~/opt/clojure-contrib/launchers/bash
    alias clj=clj-env-dir

    if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi

fi

