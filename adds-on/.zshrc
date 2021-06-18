export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt