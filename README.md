# Laptop Setup Script

Thoughtbot's [Ruby guide to Mac OSX development](http://robots.thoughtbot.com/post/8700977975/2011-rubyists-guide-to-a-mac-os-x-development) inspired me to create my own script to install and update the tools I use for development and general use. This also serves as documenting what I installed and more importantly **how** since I'm using the same commands I ran but now in reusable shell scripts.

## Installation
* Set [Terminal with Full Disk Access](https://github.com/mathiasbynens/dotfiles/issues/849#issuecomment-623799514) temporarily
* `xcode-select --install` for command line tools ([FAQ](https://www.junian.net/dev/xcode-command-line-tools-installation-faq/))
* [Create a temporary GitHub PAT](https://github.com/settings/tokens/new) and use when prompted
* `git clone https://javierjulio@github.com/javierjulio/laptop.git ~/Projects/laptop`
* Import [Terminal Themes](https://github.com/javierjulio/laptop/tree/master/themes), set one as the default and then restart Terminal
* `cd ~/Projects/laptop && ./laptop`
* Open Keychain Access and delete matching GitHub PAT login item
* Running `git push` should prompt for login using [Git Credential Manager](https://github.com/GitCredentialManager/git-credential-manager)
* [Enable Settings Sync in Visual Studio Code](https://code.visualstudio.com/docs/editor/settings-sync) using GitHub login
* `brew doctor` to verify setup

### Windows 11 App Setup

Open a Command Prompt as administrator and run the following to install apps:

```
winget install --id=Valve.Steam -e  && winget install --id=Google.Chrome -e  && winget install --id=AgileBits.1Password -e  && winget install --id=EpicGames.EpicGamesLauncher -e  && winget install --id=Amazon.Games -e  && winget install --id=Ubisoft.Connect -e  && winget install --id=ElectronicArts.EADesktop -e  && winget install --id=Blizzard.BattleNet -e  && winget install --id=WeMod.WeMod -e  && winget install --id=ItchIo.Itch -e  && winget install --id=GOG.Galaxy -e  && winget install --id=Google.PlayGames.Beta -e  && winget install --id=JetBrains.dotPeek -e  && winget install --id=PPSSPPTeam.PPSSPP -e  && winget install --id=PCSX2Team.PCSX2 -e  && winget install --id=Libretro.RetroArch -e
```

### Development

Run tests: `bats -r test`

For more info on setting macOS defaults programmatically: https://lapcatsoftware.com/articles/containers.html

#### Resources
* https://github.com/rkalis/dotfiles
* https://github.com/paveg/dotfiles
* https://github.com/ascarter/dotfiles
* https://github.com/mathiasbynens/dotfiles
* https://github.com/janmoesen/tilde
* https://github.com/gerhard/setup
#### Terminal Themes
* https://github.com/lysyi3m/osx-terminal-themes
* https://draculatheme.com/terminal/
#### zsh Transition
* https://support.apple.com/en-us/HT208050
* https://scriptingosx.com/2019/06/moving-to-zsh/
* For git completion with `g` alias:
  * https://github.com/robbyrussell/oh-my-zsh/issues/7459#issuecomment-499487413
  * https://medium.com/@oliverspryn/adding-git-completion-to-zsh-60f3b0e7ffbc
* For bash completion: https://github.com/eddiezane/lunchy/issues/57#issuecomment-448588918
