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
    sudo apt-get update && sudo apt upgrade
    echo "...done"
    echo "Using apt to install needed packages..."
    sudo apt-get install \
    binwalk \ 
    curl \ 
    fonts-powerline \ 
    libghc-xmonad-wallpaper-dev \ 
    locate \
    neofetch \ 
    neovim \ 
    ranger \
    texlive-full \
    tree \
    wget \ 
    xmobar \
    xmonad
    echo "...done"
elif [ $distro = "MacOS" ]; then
    echo "Updating and upgrading packages..."
    brew update && brew upgrade
    echo "...done"
    echo "Using brew to install needed packages..."
    brew install \
    alacritty \
    curl \
    findutils \
    neofetch \
    neovim \
    ranger \
    tree \ 
    wget 
elif [ $distro = "Arch"]; then
    echo "Updating and upgrading packages..."
    pacman -Syy
    echo "...done"
    echo "Using pacman to install needed packages..."
    pacman -S \
    alacritty \
    dmenu \
    neofetch \
    ranger \
    tree \
    xcompmg \
    xmobar \
    xmonad \
    xmonad-contrib
    echo "...done"
fi

# Create directories
if [ ! -d $HOME/.config/alacritty ]; then
    echo "Creating .config/alacritty directory..."
    mkdir -p $HOME/.config/alacritty
    echo "...done"
fi

if [ ! -d $HOME/.config/nvim ]; then
    echo "Creating .config/nvim directory..."
    mkdir -p $HOME/.config/nvim
    echo "...done"
fi
if [ ! -d $HOME/.config/xmobar ]; then
    echo "Creating .config/xmobar..."
    mkdir -p $HOME/.config/xmobar
    echo "...done"
fi
if [ ! -d $HOME/.xmonad ]; then
    echo "Creating .xmonad directory..."
    mkdir -p $HOME/.xmonad
    echo "...done"
fi

# Install vim-plug
if [ ! -e $HOME/.local/share/nvim/site/autoload/plug.vim ]; then
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

# Symbolic link alacritty config
if [ -e $HOME/.config/alacritty/alacritty.yml ] || [ -h $HOME/.config/alacritty/alacritty.yml ]; then
    echo "Deleting old alacritty.yml..."
    rm $HOME/.config/alacritty/alacritty.yml
    echo "...done"
fi

echo "Creating symbolic link to $HOME/.dotfiles/alacritty.yml..."
ln -s $HOME/.dotfiles/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml
echo "...done"

# Symbolic link gdb config
if [ -e $HOME/.gdbinit ] || [ -h $HOME/.gdbinit ]; then
    echo "Deleting old .gdbinit..."
    rm $HOME/.gdbinit
    echo "...done"
fi
echo "Creating symbolic link to $HOME/.dotfiles/gdb/.gdbinit..."
ln -s $HOME/.dotfiles/gdb/.gdbinit $HOME/.gdbinit
echo "...done"

# Symbolic link ghci config
if [ -e $HOME/.ghc/ghci.conf ] || [ -h $HOME/.ghc/ghci.conf ]; then
    echo "Deleting old ghci.conf...."
    rm $HOME/.ghc/ghci.conf
    echo "...done"
fi
echo "Creating symbolic link to $HOME/.dotfiles/ghc/ghci.conf..."
ln -s $HOME/.dotfiles/ghc/ghci.conf $HOME/.ghc/ghci.conf
echo "...done"

# Install pwndbg
echo "Installing pwndbg..."
cd $HOME/.dotfiles/tools/pwndbg/
./setup.sh
cd $HOME
echo "...done"

# Symbolic link nvim config
if [ -e $HOME/.config/nvim/init.vim ] || [ -h $HOME/.config/nvim/init.vim ]; then
    echo "Deleting old init.vim..."
    rm -f $HOME/.config/nvim/init.vim
    echo "...done"
fi
if [ -e $HOME/.vimrc ] || [ -h $HOME/.vimrc ]; then
    echo "Removing old .vimrc..."
    rm $HOME/.vimrc
    echo "...done"
fi
echo "Creating symbolic link to $HOME/.dotfiles/vim/.vimrc"
ln -s $HOME/.dotfiles/vim/.vimrc $HOME/.config/nvim/init.vim
echo "...done"

# Install oh-my-zsh if not already installed
if [ ! -d $HOME/.oh-my-zsh ]; then
    echo "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo "...done"
fi

# Add custom oh-my-zsh theme
if [ ! -e $HOME/.oh-my-zsh/themes/zion.zsh-theme ] || [ -h $HOME/.oh-my-zsh/themes/zion.zsh-theme ]; then
    echo "Removing old oh-my-zsh theme..."
    rm $HOME/.oh-my-zsh/themes/zion.zsh-theme
    echo "...done"
fi
echo "Creating symbolic linke to $HOME/.dotfiles/oh-my-zsh/themes/zion.zsh-theme..."
ln -s $HOME/.dotfiles/oh-my-zsh/themes/zion.zsh-theme $HOME/.oh-my-zsh/themes/zion.zsh-theme
echo "...done"

# Symbolic link tmux.conf
if [ -e $HOME/.tmux.conf ] || [ -h $HOME/.tmux.conf ]; then
    echo "Removing old .tmux.conf..."
    rm $HOME/.tmux.conf
    echo "...done"
fi
echo "Creating symbolic link to $HOME/.dotfiles/tmux/.tmux.conf..."
ln -s $HOME/.dotfiles/tmux/.tmux.conf $HOME/.tmux.conf
echo "...done"

# Symbolic link .xmobarrc
if [ -e $HOME/.config/xmobar/.xmobarrc ] || [ -h $HOME/.config/xmobar/.xmobarrc ]; then
    echo "Removing old .xmobarrc..."
    rm $HOME/.config/xmobar/.xmobarrc
    echo "...done"
fi
if [ -e $HOME/.xmobarrc ] || [ -h $HOME/.xmobarrc ]; then
    echo "Removing old .xmobarrc..."
    rm $HOME/.xmobarrc
    echo "...done"
fi
echo "Creating symbolic link to $HOME/.dotfiles/xmobar/xmobarrc..."
ln -s $HOME/.dotfiles/xmobar/xmobarrc $HOME/.config/xmobar/.xmobarrc
echo "...done"

# Symbolic link xmonad.hs
if [ -e $HOME/.xmonad/xmonad.hs ] || [ -h $HOME/.xmonad/xmonad.hs ]; then
    echo "Removing old xmonad.hs..."
    rm $HOME/.xmonad/xmonad.hs
    echo "...done"
fi
echo "Creating symbolic link to $HOME/.dotfiles/xmonad/xmonad.hs..."
ln -s $HOME/.dotfiles/xmonad/xmonad.hs $HOME/.xmonad/xmonad.hs
echo "...done"

# Symbolic link .xinitrc
if [ -e $HOME/.xinitrc ] || [ -h $HOME/.xinitrc ]; then
    echo "Removing old .xinitrc..."
    rm $HOME/.xinitrc
    echo "...done"
fi
echo "Creating symbolic link to $HOME/.dotfiles/xinitrc..."
ln -s $HOME/.dotfiles/xinitrc $HOME/.xinitrc
echo "...done"

# Symbolic link .xprofile
if [ -e $HOME/.xprofile ] || [ -h $HOME/.xprofile ]; then
    echo "Removing old .xprofile..."
    rm $HOME/.xprofile
    echo "...done"
fi
ln -s $HOME/.dotfiles/xprofile $HOME/.xprofile

# Install zsh-syntax-highlighting if not already installed
if [ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
    echo "Installing zsh-syntax-highlighting"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    echo "...done"
fi

# Symbolic link .zshrc
if [ -e $HOME/.zshrc ] || [ -h $HOME/.zshrc ]; then
    echo "Removing old .zshrc..."
    rm $HOME/.zshrc
    echo "...done"
fi
echo "Creating symbolic link to $HOME/.dotfiles/zsh/.zshrc..."
ln -s $HOME/.dotfiles/zsh/.zshrc $HOME/.zshrc
echo "...done"

