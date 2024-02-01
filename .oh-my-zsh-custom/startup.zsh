if [[ -f /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# rbenv
eval "$($HOME/.rbenv/bin/rbenv init - zsh)"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
