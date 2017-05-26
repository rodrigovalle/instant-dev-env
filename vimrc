call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'lervag/vimtex'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
call plug#end()

let maplocalleader=','
let g:vimtex_viewer_general = 'open -a Preview'

set guifont=Monaco:h13
set guioptions-=T

set background=dark
silent! colorscheme gruvbox

set number
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set conceallevel=0
