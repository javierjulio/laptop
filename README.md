# Laptop Setup Script

Thoughtbot's [Ruby guide to Mac OSX development](http://robots.thoughtbot.com/post/8700977975/2011-rubyists-guide-to-a-mac-os-x-development) inspired me to create my own set of scripts to install or update all the common tools I use for development and in general. Most tools are updated by simply rerunning the script but some major ones are left out as a precaution. For example, Ruby, Node or any Homebrew packages won't be updated if you rerun the laptop script. This also serves as documenting what tools I installed and how since I'm using the same commands I ran but now in rerunnable bash scripts.

## Installation

 * Run Software Update
 * Install [Dropbox](https://www.dropbox.com/) and [Things for Mac](http://culturedcode.com/things/)
 * Install purchased apps from Mac App Store including 1Password and [Xcode](http://itunes.apple.com/us/app/xcode/id497799835?mt=12)
 * `xcode-select --install` to install Command Line Developer Tools
 * Use [Terminal Ocean Dark Theme](https://github.com/mdo/ocean-terminal)
 * Install [Heroku Toolbelt](https://toolbelt.heroku.com/)
 * `git clone https://github.com/javierjulio/laptop.git ~/Projects/laptop`
 * `cd ~/Projects/laptop && ./laptop`
 * Install [Visual Studio Code](https://code.visualstudio.com/) and install [sync settings extension](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync) and provide GitHub access token
 * Install a Postgres Mac app: [PSequel](http://www.psequel.com), [Postico](https://eggerapps.at/postico/), [DBGlass](http://dbglass.web-pal.com) and [SQLPro for Postgres](http://macpostgresclient.com). Stick with PSequel for now.

### Optional

 * Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
 * Install [IE9-10 Virtual Machines](https://github.com/xdissent/ievms)
