# Composer installs
export COMPOSER_MEMORY_LIMIT=-1

# Make docker user buildkit and make docker-compose use docker cli
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1

# Always enable colored `grep` output
export GREP_OPTIONS="--color=auto"

# Make some commands not show up in history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"

# For capybara-webkit
export PATH="/Users/cbennell/Applications/Qt5.5.0/5.5/clang_64/bin:$PATH"

# Make sure homebrew ruby is first in PATH
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/lib/ruby/gems/3.1.0/bin:$PATH"
export PATH="/opt/homebrew/lib/ruby/gems/3.2.0/bin:$PATH"
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:~/.composer

# Postgresql
export PATH=$PATH:/opt/homebrew/opt/libpq/bin
export PATH=$PATH:/opt/homebrew/opt/postgresql@16/bin
export LDFLAGS="-L/opt/homebrew/opt/postgresql@16/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@16/include"
