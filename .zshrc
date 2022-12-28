export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="ys"

plugins=(git docker kubectl zsh-syntax-highlighting dotenv)

source $ZSH/oh-my-zsh.sh


alias zshconfig="code ~/.zshrc"
alias reload="source ~/.zshrc"

alias gummit="zsh ~/utility-scripts/gummit.sh"
alias gu="gummit"
alias shell="zsh ~/utility-scripts/shell.sh"
alias quote="zsh ~/utility-scripts/quote.sh"
alias inspector="source ~/utility-scripts/open.sh"
alias today="zsh ~/utility-scripts/today.sh"
alias clip="xclip -selection clipboard"
alias gunk="git diff | dunk"
alias todo="todoist-cli"

export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin"

ls ~/.zsh_local_config/.localzshrc &> /dev/null && source ~/.zsh_local_config/.localzshrc
