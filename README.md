# Laptop Setup Script

Thoughtbot's [Ruby guide to Mac OSX development](http://robots.thoughtbot.com/post/8700977975/2011-rubyists-guide-to-a-mac-os-x-development) inspired me to create my own script to install or update all the common tools I use for development and in general. This also serves as documenting what tools I installed and how since I'm using the same commands I ran but now in rerunnable bash scripts.

## Installation

 * Set [Terminal Theme](https://github.com/javierjulio/laptop/tree/master/themes) and update font to Menlo Regular 12 pt
 * `xcode-select --install` to install Command Line Developer Tools
 * GitHub access tokens for CLI login in 1Password
 * `git clone https://github.com/javierjulio/laptop.git ~/Projects/laptop`
 * `cd ~/Projects/laptop && ./laptop`
 * Install [sync settings extension](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync) for Visual Studio Code and provide GitHub access token
 * `touch ~/.bash_local` for system specific settings

## Dotfiles

### Resources

* https://github.com/ascarter/dotfiles
* https://github.com/holman/dotfiles
* https://github.com/rtomayko/dotfiles
* https://github.com/mathiasbynens/dotfiles
* https://github.com/janmoesen/tilde
* https://github.com/gerhard/setup
