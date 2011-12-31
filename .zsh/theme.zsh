local return_code="%(?..%{$fg[red]%}%?%{$reset_color%})"

PROMPT='%{$fg[green]%}[%n %m] %{$fg[yellow]%}%c %{$fg[red]%}%#%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='%{$fg[blue]%}%~ $(git_prompt_info)%{$reset_color%} ${return_code} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[blue]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}*%{$fg[blue]%}"

