# Laptop Setup Script

Thoughtbot's [Ruby guide to Mac OSX development](http://robots.thoughtbot.com/post/8700977975/2011-rubyists-guide-to-a-mac-os-x-development) inspired me to create my own script to install or update all the common tools for development and general use. This also serves as documenting what tools I installed and how since I'm using the same commands I ran but now in rerunnable bash scripts.

## Installation
* `xcode-select --install` to install Command Line Developer Tools
* `git clone https://github.com/javierjulio/laptop.git ~/Projects/laptop`
* Import [Terminal Theme](https://github.com/javierjulio/laptop/tree/master/themes) and set as default
* `cd ~/Projects/laptop && ./laptop`
* Install [Visual Studio Code sync settings extension](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync) and provide GitHub access token
* GitHub access tokens are in 1Password
* `touch ~/.bash_local` for system specific settings

### Resources
#### Dotfiles
* https://github.com/ascarter/dotfiles
* https://github.com/holman/dotfiles
* https://github.com/rtomayko/dotfiles
* https://github.com/mathiasbynens/dotfiles
* https://github.com/janmoesen/tilde
* https://github.com/gerhard/setup
#### Terminal Themes
* https://github.com/lysyi3m/osx-terminal-themes
* https://draculatheme.com/terminal/
