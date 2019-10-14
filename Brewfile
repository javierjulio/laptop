tap 'homebrew/bundle'
tap 'homebrew/core'
tap 'homebrew/services'
tap 'heroku/brew'
brew 'readline'
brew 'git'
brew 'grc' # Terminal colorizer
brew 'gawk'
brew 'bash-completion'
brew 'libyaml' # recommended by ruby-build and rbenv
brew 'libffi' # recommended by ruby-build and rbenv
brew 'bats-core'
brew 'ghostscript'
brew 'p7zip' # high compression file archiver (creates .7z files)
brew 'rbenv'
brew 'imagemagick@6', link: true # https://stackoverflow.com/a/43035892
brew 'postgresql@10', link: true, restart_service: true
brew 'redis', restart_service: true
brew 'erlang'
brew 'elixir'
brew 'heroku'
brew 'mas' # Mac App Store command line interface
brew 'shellcheck'
brew 'exiftool' # File metadata editor
brew 'yarn', args: ['ignore-dependencies']
brew 'deis'
# brew 'kubernetes-cli' # Install version 1.10.5 below
system "brew install https://raw.githubusercontent.com/Homebrew/homebrew-core/d09d97241b17a5e02a25fc51fc56e2a5de74501c/Formula/kubernetes-cli.rb"
