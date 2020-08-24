#!/bin/sh

# Install script for my .dotfiles

# Color scheme: Base16 Tomorrow Night
# Font: hermit
# Shell: zsh
# Terminal: alacritty
# Text editor: neovim
# Window manager: xmonad 


# Distro detect
distro=""
echo "Detecting distribution..."
if [ `uname` != "Darwin" ]; then
    if [ `cat /etc/*-release | grep -c "ubuntu"` -gt 0 ]; then
        echo "Running Ubuntu"
        distro="Ubuntu"
    fi
elif [ `uname` = "Darwin" ]; then
    echo "Running MacOs"
    distro="MacOS"
fi

# Install necessary packages
if [ $distro = "Ubuntu" ] || [ $distro = "Debian" ]; then
    echo "Updating and upgrading packages..."
    sudo apt update && sudo apt upgrade
    echo "...done"
    echo "Using apt to install needed packages..."
    sudo apt install curl fonts-powerline libghc-xmonad-wallpaper-dev neofetch neovim openjdk-13-jdk ranger tree wget xmobar xmonad
    echo "...done"
elif [ $distro = "MacOS" ]; then
    echo "Updating and upgrading packages..."
    brew update && brew upgrade
    echo "...done"
    echo "Using brew to install needed packages..."
    brew install alacritty curl neofetch neovim ranger tree wget
elif [ $distro = "Arch"]; then
    echo "Updating and upgrading packages..."
    pacman -Syy
    echo "...done"
    echo "Using pacman to install needed packages..."
    pacman -S alacritty dmenu neofetch ranger tree xcompmg xmoibar xmonad xmonad-contrib
    echo "...done"
fi

# Create directories
if [ ! -d ~/.config/alacritty ]; then
    echo "Creating .config/alacritty directory..."
    mkdir -p ~/.config/alacritty
    echo "...done"
fi

if [ ! -d ~/.config/nvim ]; then
    echo "Creating .config/nvim directory..."
    mkdir -p ~/.config/nvim
    echo "...done"
fi
if [ ! -d ~/.config/xmobar ]; then
    echo "Creating .config/xmobar..."
    mkdir -p ~/.config/xmobar
    echo "...done"
fi

# Install vim-plug
if [ ! -e ~/.local/share/nvim/site/autoload/plug.vim ]; then
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

# Symbolic link alacritty config
if [ -e ~/.config/alacritty/alacritty.yml ] || [ -h ~/.config/alacritty/alacritty.yml ]; then
    echo "Deleting old alacritty.yml..."
    rm ~/.config/alacritty/alacritty.yml
    echo "...done"
fi

echo "Creating symbolic link to ~/.dotfiles/alacritty.yml..."
ln -s ~/.dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
echo "...done"

# Symbolic link gdb config
if [ -e ~/.gdbinit ] || [ -h ~/.gdbinit ]; then
    echo "Deleting old .gdbinit..."
    rm ~/.gdbinit
    echo "...done"
fi
echo "Creating symbolic link to ~/.dotfiles/gdb/.gdbinit..."
ln -s ~/.dotfiles/gdb/.gdbinit ~/.gdbinit
echo "...done"

# Install pwndbg
echo "Installing pwndbg..."
cd ~/.dotfiles/tools/pwndbg/
./setup.sh
cd ~
echo "...done"

# Symbolic link nvim config
if [ -e ~/.config/nvim/init.vim ] || [ -h ~/.config/nvim/init.vim ]; then
    echo "Deleting old init.vim..."
    rm -f ~/.config/nvim/init.vim
    echo "...done"
fi
if [ -e ~/.vimrc ] || [ -h ~/.vimrc ]; then
    echo "Removing old .vimrc..."
    rm ~/.vimrc
    echo "...done"
fi
echo "Creating symbolic link to ~/.dotfiles/vim/.vimrc"
ln -s ~/.dotfiles/vim/.vimrc ~/.config/nvim/init.vim
echo "...done"

# Install oh-my-zsh if not already installed
if [ ! -d ~/.oh-my-zsh ]; then
    echo "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo "...done"
fi

# Add custom oh-my-zsh theme
ln -s ~/.dotfiles/oh-my-zsh/themes/zion.zsh-theme ~/.oh-my-zsh/themes/zion.zs-theme

# Symbolic link tmux.conf
if [ -e ~/.tmux.conf ] || [ -h ~/.tmux.conf ]; then
    echo "Removing old .tmux.conf..."
    rm ~/.tmux.conf
    echo "...done"
fi
echo "Creating symbolic link to ~/.dotfiles/tmux/.tmux.conf..."
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
echo "...done"

# Symbolic link .xmobarrc
if [ -e ~/.config/xmobar/.xmobarrc ] || [ -h ~/.config/xmobar/.xmobarrc ]; then
    echo "Removing old .xmobarrc..."
    rm ~/.config/xmobar/.xmobarrc
    echo "...done"
fi
if [ -e ~/.xmobarrc ] || [ -h ~/.xmobarrc ]; then
    echo "Removing old .xmobarrc..."
    rm ~/.xmobarrc
    echo "...done"
fi
echo "Creating symbolic link to ~/.dotfiles/xmobar/xmobarrc..."
ln -s ~/.dotfiles/xmobar/xmobarrc ~/.config/xmobar/.xmobarrc
echo "...done"

# Symbolic link xmonad.hs
if [ -e ~/.xmonad/xmonad.hs ] || [ -h ~/.xmonad/xmonad.hs ]; then
    echo "Removing old xmonad.hs..."
    rm ~/.xmonad/xmonad.hs
    echo "...done"
fi
echo "Creating symbolic link to ~/.dotfiles/xmonad/xmonad.hs..."
ln -s ~/.dotfiles/xmonad/xmonad.hs ~/.xmonad/xmonad.hs
echo "...done"

# Symbolic link .xinitrc
if [ -e ~/.xinitrc ] || [ -h ~/.xinitc ]; then
    echo "Removing old .xinitrc..."
    rm ~/.xinitrc
    echo "...done"
fi
echo "Creating symbolic link to ~/.dotfiles/xinitrc..."
ln -s ~/.dotfiles/xinitrc ~/.xinitrc
echo "...done"

# Symbolic link .xprofile
if [ -e ~/.xprofile ] || [ -h ~/.xprofile ]; then
    echo "Removing old .xprofile..."
    rm ~/.xprofile
    echo "...done"
fi
ln -s ~/.dotfiles/xprofile ~/.xprofile

# Install zsh-syntax-highlighting if not already installed
if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
    echo "Installing zsh-syntax-highlighting"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    echo "...done"
fi

# Symbolic link .zshrc
if [ -e ~/.zshrc ] || [ -h ~/.zshrc ]; then
    echo "Removing old .zshrc..."
    rm ~/.zshrc
    echo "...done"
fi
echo "Creating symbolic link to ~/.dotfiles/zsh/.zshrc..."
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
echo "...done"

