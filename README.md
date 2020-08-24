# dotfiles
My personal dotfiles. 

## Software
- **Browser**: [firefox](https://www.mozilla.org/en-US/exp/firefox/)
- **Colorscheme**: [base16 tomorrow-night](https://github.com/chriskempson/base16-tomorrow-scheme)
- **Font**: [hermit](https://pcaro.es/p/hermit/)
- **Menu**: [dmenu](https://tools.suckless.org/dmenu/)
- **PDF reader**: [zathura](https://pwmt.org/projects/zathura/)
- **Shell**: [zsh](http://zsh.sourceforge.net/)
- **Status bar**: [xmobar](https://xmobar.org/)
- **Terminal**: [alacritty](https://github.com/alacritty/alacritty)
- **Text editor**: [neovim](https://neovim.io/)
- **Terminal multiplexer**: [tmux](https://github.com/tmux/tmux/wiki)
- **Window manager**: [xmonad](https://xmonad.org/)

## Keyboard shortcuts
### XMonad
|            Key Binding                        |                   Action                 |
|----------------------------------------------:|:------------------------------------------
|<kbd>Super</kbd>+<kbd>Shift</kbd>+<kbd>Return</kbd> | Open terminal                       |

## Installation
- To install, clone into your home directory along with submodules with `git clone --recurse-submodules --remote-submodules https://github.com/shanereilly/.dotfiles.git`. 
- Run `~/.dotfiles/install.sh`. 

Note, this script will remove all current dotfiles stored in their default locations and recreate them as symlinks.
