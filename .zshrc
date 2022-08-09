export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="ys"

plugins=(git docker kubectl zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh


alias zshconfig="code ~/.zshrc"
alias reload="source ~/.zshrc"

alias gummit="zsh ~/utility-scripts/gummit.sh"
alias gu="gummit"
alias shell="zsh ~/utility-scripts/shell.sh"
alias quote="zsh ~/utility-scripts/quote.sh"
alias open="source ~/utility-scripts/use.sh"
alias today="zsh ~/utility-scripts/today.sh"
alias clip="xclip -selection clipboard"
alias todo="todoist-cli"

export PATH="$PATH:$HOME/.local/bin"

ls ~/.zsh_local_config/.localzshrc &> /dev/null && source ~/.zsh_local_config/.localzshrc

quote
today