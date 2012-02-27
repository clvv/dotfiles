# Jobs
setopt LONG_LIST_JOBS # List jobs in the long format by default.
setopt AUTO_RESUME # Attempt to resume existing job before creating a new process.
setopt NOTIFY # Report status of background jobs immediately.
unsetopt BG_NICE # Don't run all background jobs at a lower priority.
unsetopt HUP # Don't kill jobs on shell exit.
unsetopt CHECK_JOBS # Don't report on jobs when shell exit.

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
unsetopt HIST_VERIFY

# Directory
setopt AUTO_CD
setopt AUTO_PUSHD
setopt AUTO_NAME_DIRS
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_TO_HOME
setopt MULTIOS

setopt PROMPT_SUBST
setopt INTERACTIVECOMMENTS
setopt NO_BEEP

autoload colors; colors;
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

autoload -U edit-command-line
zle -N edit-command-line

autoload -U add-zsh-hook

