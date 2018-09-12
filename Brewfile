tap 'homebrew/bundle'
tap 'homebrew/core'
tap 'homebrew/services'
brew 'readline'
brew 'git', args: ["with-openssl"]
brew 'grc' # Terminal colorizer
brew 'gawk'
brew 'bash-completion'
brew 'libyaml'
brew 'libffi'
brew 'bats-core'
brew 'pkg-config'
brew 'ghostscript'
brew 'imagemagick@6', link: true # https://stackoverflow.com/a/43035892
brew 'postgresql@9.6', link: true, restart_service: true
brew 'redis', restart_service: true
brew 'erlang'
brew 'elixir'
brew 'heroku'
brew 'mas' # Mac App Store command line interface
brew 'shellcheck'
brew 'yarn', args: ['--without-node']
brew 'deis'
# brew 'kubernetes-cli' # Install version 1.10.5 below
system "brew install https://raw.githubusercontent.com/Homebrew/homebrew-core/d09d97241b17a5e02a25fc51fc56e2a5de74501c/Formula/kubernetes-cli.rb"
