local return_code="%(?..%{$fg[red]%}%?%{$reset_color%})"

PROMPT='%{$fg[green]%}[%n %m] %{$fg[yellow]%}%c %{$fg[red]%}%#%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='%{$fg[blue]%}%~ %{$reset_color%}${return_code}'

