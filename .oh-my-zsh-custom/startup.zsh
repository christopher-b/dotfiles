if [[ -f /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# rbenv
if [[ -d $HOME/.rbenv/bin ]]; then
  PATH=$HOME/.rbenv/bin:$PATH
fi
eval "$(rbenv init - zsh)"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
