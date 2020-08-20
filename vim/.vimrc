" Line numbering
set nu relativenumber

" Tabs become four spaces
set tabstop=4 shiftwidth=4 expandtab

" Plugins
call plug#begin('~/.dotfiles/vim/plugs')
Plug 'chriskempson/base16-vim'
call plug#end()

" Colors
set termguicolors
let base16colorspace=256
colorscheme base16-default-dark
