# Laptop Setup Script

Thoughtbot's [Ruby guide to Mac OSX development](http://robots.thoughtbot.com/post/8700977975/2011-rubyists-guide-to-a-mac-os-x-development) inspired me to create my own set of scripts to install all the common tools I use for development. This really only applies for when setting up a new Mac but since I wanted to document what tools I installed anyway I loved how easy it is to do that all programmatically using bash. Feel free to fork or copy and alter to meet your needs.

## Installation
 
 * Install Git or install through the GitHub for Mac app
 * [Install Xcode 4.3](http://itunes.apple.com/us/app/xcode/id497799835?mt=12)
   * If installing Node.js its best to install Xcode since for some reason it binds to CoreData.
   * Xcode 4.3 now separates CLI tools into a second download. Details: https://gist.github.com/1847012
 * Start Xcode -> Preferences -> Downloads -> Install command line tools
 * Run `bash < <(curl -s https://raw.github.com/javierjulio/laptop/master/mac)`