setopt auto_name_dirs
setopt auto_pushd
setopt pushd_ignore_dups

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt hist_ignore_dups
setopt share_history

#setopt hist_verify
setopt inc_append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_space

setopt SHARE_HISTORY
setopt APPEND_HISTORY

autoload colors; colors;
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

autoload -U edit-command-line
zle -N edit-command-line

autoload -U add-zsh-hook

setopt no_beep
setopt auto_cd
setopt multios
setopt long_list_jobs
setopt prompt_subst
setopt interactivecomments

