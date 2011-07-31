export ZSH=$HOME/.zsh

for config ($ZSH/*.zsh) source $config

[ -s "$HOME/.shenv" ] && source $HOME/.shenv
[ -s "$HOME/.aliases" ] && source $HOME/.aliases

function precmd () {
    _z --add "$(pwd -P)"
}
