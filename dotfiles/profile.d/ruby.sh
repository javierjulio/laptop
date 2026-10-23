#!/bin/sh

alias be='bundle exec'
alias bi='bundle install'
alias bu='bundle update'
alias bo='bundle outdated'
alias bopen='bundle open' # bundle open rails
alias ber='bundle exec rake'
alias bert='bundle exec rake test'

alias berc='bin/rails console'
alias berdm='bin/rails db:migrate && bin/rails db:migrate RAILS_ENV=test'
alias rl='tail -f log/development.log'

# Open gem source code in Visual Studio Code
export BUNDLER_EDITOR="code"

# Use plain IRB for Rails console
export DISABLE_PRY_RAILS="1"

# Output Ruby deprecation warnings
export RUBYOPT="-W:deprecated"
