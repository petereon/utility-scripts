f() {
    rg --line-number -u --hidden . | fzf --ansi --print0 -q "$1" | gcut -z -d : -f 1-2 | xargs -0 -I {} -r code -g {}":0"
}
