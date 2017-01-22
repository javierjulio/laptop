# Laptop Setup Script

Thoughtbot's [Ruby guide to Mac OSX development](http://robots.thoughtbot.com/post/8700977975/2011-rubyists-guide-to-a-mac-os-x-development) inspired me to create my own set of scripts to install or update all the common tools I use for development and in general. Most tools are updated by simply rerunning the script but some major ones are left out as a precaution. For example, Ruby, Node or any Homebrew packages won't be updated if you rerun the laptop script. This also serves as documenting what tools I installed and how since I'm using the same commands I ran but now in rerunnable bash scripts.

## Installation

 * Set [Terminal Theme](https://github.com/javierjulio/laptop/tree/master/themes) and update font to Menlo Regular 12 pt
 * `xcode-select --install` to install Command Line Developer Tools
 * `git clone https://github.com/javierjulio/laptop.git ~/Projects/laptop`
 * `cd ~/Projects/laptop && ./laptop`
 * Install [sync settings extension](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync) for Visual Studio Code and provide GitHub access token
 * Install a Postgres Mac app: [PSequel](http://www.psequel.com), [Postico](https://eggerapps.at/postico/), [DBGlass](http://dbglass.web-pal.com) and [SQLPro for Postgres](http://macpostgresclient.com).

### Optional

For IE browser testing use [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [IE Virtual Machines](https://github.com/xdissent/ievms)

## Dotfiles

Create a `~/.bash_local` file for system specific settings as existing `~/.profile` will load it if it exists.

### Resources

* https://github.com/ascarter/dotfiles
* https://github.com/holman/dotfiles
* https://github.com/rtomayko/dotfiles
* https://github.com/ryanb/dotfiles
* https://github.com/minhajuddin/dotfiles
* https://github.com/mathiasbynens/dotfiles
* https://github.com/gf3/dotfiles
* https://github.com/janmoesen/tilde
* https://github.com/krishicks/dotfiles
