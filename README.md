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

### tmux

|                 Key Binding                        |                  Action             |
|---------------------------------------------------:|:------------------------------------|
|<kbd>Ctrl</kbd>+<kbd>b</kbd>                        | Prefix key                          |
|<kbd>Prefix</kbd>+<kbd>\|</kbd>                      | Split vertically                    |
|<kbd>Prefix</kbd>+<kbd>-</kbd>                      | Split horizontally                  |

### XMonad
|                 Key Binding                        |                  Action             |
|---------------------------------------------------:|:------------------------------------|
|<kbd>Super</kbd>+<kbd>Shift</kbd>+<kbd>Return</kbd> | Start a terminal                    |
|<kbd>Super</kbd>+<kbd>p</kbd>                       | Start dmenu                         |
|<kbd>Super</kbd>+<kbd>Shift</kbd>+<kbd>c</kbd>      | Close focused window                |
|<kbd>Super</kbd>+<kbd>Space</kbd>                   | Change workspace layout             |
|<kbd>Super</kbd>+<kbd>Shift</kbd>+<kbd>Space</kbd>  | Change back to default layout       |
|<kbd>Super</kbd>+<kbd>Tab</kbd>                     | Focus next window                   |
|<kbd>Super</kbd>+<kbd>j</kbd>                       | Focus next window                   |
|<kbd>Super</kbd>+<kbd>k</kbd>                       | Focus previous window               |
|<kbd>Super</kbd>+<kbd>m</kbd>                       | Focus master window                 |
|<kbd>Super</kbd>+<kbd>Return</kbd>                  | Swap focused window/master window   |
|<kbd>Super</kbd>+<kbd>Shift</kbd>+<kbd>j</kbd>      | Swap focused window/next window     |
|<kbd>Super</kbd>+<kbd>Shift</kbd>+<kbd>k</kbd>      | Swap focused window/previous window |
|<kbd>Super</kbd>+<kbd>h</kbd>                       | Shrink master window area           |
|<kbd>Super</kbd>+<kbd>l</kbd>                       | Expand master window area           |
|<kbd>Super</kbd>+<kbd>t</kbd>                       | Floating window back into tiling    |
|<kbd>Super</kbd>+<kbd>,</kbd>                       | Increment windows in master area    |
|<kbd>Super</kbd>+<kbd>.</kbd>                       | Decrement windows in master area    |
|<kbd>Super</kbd>+<kbd>q</kbd>                       | Restart XMonad                      |
|<kbd>Super</kbd>+<kbd>Shift</kbd>+<kbd>q</kbd>      | Quit xmonad and logout              |
|<kbd>Super</kbd>+<kbd>[1-9]</kbd>                   | Switch to workspace                 |
|<kbd>Super</kbd>+<kbd>Shift</kbd>+<kbd>[1-9]</kbd>  | Send focused window to workspace    |
|<kbd>Super</kbd>+<kbd>Left Mouse Drag</kbd>         | Drag focused window out of tiling   |
|<kbd>Super</kbd>+<kbd>Right Mouse Drag</kbd>        | Resize focused window               |
|<kbd>Super</kbd>+<kbd>Right Mouse Drag</kbd>        | Resize focused window               |

## Installation
- To install, clone into your home directory along with submodules with `git clone --recurse-submodules --remote-submodules https://github.com/shanereilly/.dotfiles.git`. 
- Run `~/.dotfiles/install.sh`. 

Note, this script will remove all current dotfiles stored in their default locations and recreate them as symlinks.
