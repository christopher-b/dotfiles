# alias chardis="awk -vFS=\"\" '{for(i=1;i<=NF;i++)w[$i]++}END{for(i in w) print i,w[i]}' -"alias

# Misc
alias :q='exit'
alias chrome='open -a "Google Chrome"'
alias gr='git remote -v'
alias grep='grep -E'
alias k='kubectl'
alias l='less'
alias ls='ls -lAG'
alias rmd='rm -rf'
alias tf='tail -f'
alias v='nvim'
alias vim='nvim'
alias vc='cd ~/.config/nvim && nvim'

# Scripts
# alias ff='~/.oh-my-zsh-custom/scripts/find-in-files.sh'

# Bundler / Rails
alias be='bundle exec'
alias bi='bundle install'
alias rc='bundle exec rails console'
# alias rbenv-init='eval "$(rbenv init -)"'
alias rrc='bundle exec cap production rails:console'

# YADM
alias y='yadm'
alias ya='yadm add'
alias yc='yadm commit'
alias ycm='yadm commit -m'
alias yd='yadm diff'
alias ypu='yadm push'
alias ypl='yadm pull'
alias ys='yadm status'

# Lando
alias lo='lando'
alias lor='lando restart'
alias lorby='lando rebuild -y'
alias loi='lando info'
alias lrc='lando rails console'
