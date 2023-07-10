export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="ys"

plugins=(git kubectl zsh-syntax-highlighting dotenv)

source $ZSH/oh-my-zsh.sh

add-to-path() {
  for p in $@; do
      export PATH="$p:$PATH"
  done
}

add-to-path \
    "$HOME/.local/bin" \
    "$HOME/.ghcup/bin"\
    "$HOME/.cabal/bin" \
    "$HOME/.cargo/bin"  \
    "$HOME/.nimble/bin"  \
    "$HOME/go/bin"  \
    "$HOME/esp/xtensa-esp32-elf/bin"

alias zshconfig="code ~/.zshrc"
alias reload="source ~/.zshrc"

alias gummit="zsh ~/utility-scripts/gummit.sh"
alias clip="xclip -selection clipboard"
alias cd="z"
alias cdi="zi"
alias ls="exa"

ls ~/.localzshrc &> /dev/null && source ~/.localzshrc
[ -f "/Users/macbookpro/.ghcup/env" ] && source "/Users/macbookpro/.ghcup/env" # ghcup-env. $HOME/.ghcup/env

source ~/utility-scripts/f.sh

eval "$(zoxide init zsh)"
