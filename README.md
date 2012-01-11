# Laptop

Thoughtbot's [Ruby guide to Mac OSX development](http://robots.thoughtbot.com/post/8700977975/2011-rubyists-guide-to-a-mac-os-x-development) inspired me to create my own set of scripts to install all the common tools I use for development. This really only applies for when setting up a new Mac but since I wanted to document what tools I installed anyway I loved how easy it is to do that all programmatically using bash. Feel free to fork or copy and alter to meet your needs.

## Installation

 * [Install Xcode 4.2](http://itunes.apple.com/us/app/xcode/id448457090?mt=12) and this will also install Git or install the GitHub for Mac app
 * [Install OSX GCC](https://github.com/kennethreitz/osx-gcc-installer/downloads) for Ruby 1.9.3 support as there is [an issue](https://github.com/sstephenson/ruby-build/pull/87) with setting a compiler flag to use ```clang``` from Xcode 4.2.
 * Run `bash < <(curl -s https://raw.github.com/javierjulio/laptop/master/mac)`
