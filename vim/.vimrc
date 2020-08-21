" Line numbering
set nu relativenumber

" Tabs become four spaces
set tabstop=4 shiftwidth=4 expandtab

" Plugins
call plug#begin('~/.dotfiles/vim/plugs')
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'dawikur/base16-vim-airline-themes'
call plug#end()

" Colors
set termguicolors
let base16colorspace=256
colorscheme base16-default-dark
let g:airline_theme='base16_tomorrow_night'

