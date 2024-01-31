# Profile zsh startup. Paied with zprof call at bottom of this file
# zmodload zsh/zprof

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Prevent many instances of $HOME/.zcompdump*
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# export PATH="$HOME/.rbenv/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.oh-my-zsh-custom

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
POWERLEVEL9K_MODE='awesome-patched'
ZSH_THEME="powerlevel10k/powerlevel10k"
HYPHEN_INSENSITIVE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh-custom/plugins/
# Add plugins as git submodules to play well with YADM:
# cd ~ && yadm submodule add $plugin_url .oh-my-zsh-custom/$plugin-name
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  bundler
  # colorize
  # docker
  # docker-compose
  git
  macos
  tmux
  web-search
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration
# . ~/z.sh

eval "$(rbenv init - zsh)"

# export PATH="/Users/cbennell/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Powerlevel9k
DEFAULT_USER=cbennell
ZLE_RPROMPT_INDENT=0
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status load)
# POWERLEVEL9K_DIR_SHOW_WRITABLE=true
# POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes git-untracked git-aheadbehind git-stash git-remotebranch git-tagname)
# POWERLEVEL9K_VCS_GIT_ICON=''
# POWERLEVEL9K_VCS_GIT_GITHUB_ICON=''
# POWERLEVEL9K_VCS_GIT_GITLAB_ICON=''
# POWERLEVEL9K_BATTERY_VERBOSE=false

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$HOME/.yarn/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
function blt() {
  if [[ ! -z ${AH_SITE_ENVIRONMENT} ]]; then
    PROJECT_ROOT="/var/www/html/${AH_SITE_GROUP}.${AH_SITE_ENVIRONMENT}"
  elif [ "`git rev-parse --show-cdup 2> /dev/null`" != "" ]; then
    PROJECT_ROOT=$(git rev-parse --show-cdup)
  else
    PROJECT_ROOT="."
  fi

  if [ -f "$PROJECT_ROOT/vendor/bin/blt" ]; then
    $PROJECT_ROOT/vendor/bin/blt "$@"

  # Check for local BLT.
  elif [ -f "./vendor/bin/blt" ]; then
    ./vendor/bin/blt "$@"

  else
    echo "You must run this command from within a BLT-generated project."
    return 1
  fi
}

# Profile zsh startup. Paied with mod load call at top of this file
# zprof
