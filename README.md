# Laptop Setup Script

Thoughtbot's [Ruby guide to Mac OSX development](http://robots.thoughtbot.com/post/8700977975/2011-rubyists-guide-to-a-mac-os-x-development) inspired me to create my own set of scripts to install or update all the common tools I use for development (and in general). Most tools are updated by simply rerunning the script but some major ones are left out as a precaution. For example, Ruby, Node or any Homebrew packages won't be updated if you rerun the laptop script. This also serves as documenting what tools I installed which I loved how easy it is to do programmatically using bash.

## Installation

 * Run Software Update
 * Install [Dropbox](https://www.dropbox.com/)
 * Install [Things for Mac](http://culturedcode.com/things/)
 * Install purchased apps from Mac App Store including [Xcode](http://itunes.apple.com/us/app/xcode/id497799835?mt=12)
 * `xcode-select --install` to install Command Line Developer Tools [(not available through Xcode)](http://stackoverflow.com/questions/9329243/xcode-4-4-and-later-install-command-line-tools/9329325#9329325)
 * Install [Heroku Toolbelt](https://toolbelt.heroku.com/)
 * `git clone https://github.com/javierjulio/laptop.git ~/Projects/laptop`
 * `cd ~/Projects/laptop && ./laptop`
 * Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
 * Install [IE9-10 Virtual Machines](https://github.com/xdissent/ievms)
