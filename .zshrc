for config ($HOME/.zsh/*.zsh) source $config

[ -s "$HOME/.shenv" ] && source $HOME/.shenv
[ -s "$HOME/.aliases" ] && source $HOME/.aliases

function _z_precmd () { _z --add "$(pwd -P)" }
add-zsh-hook precmd _z_precmd

