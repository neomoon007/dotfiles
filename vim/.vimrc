" Fix True Color
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"

" Set True Color
set termguicolors

call plug#begin()
" Install nightly theme and vim airline
Plug 'https://github.com/bluz71/vim-nightfly-guicolors'
Plug 'https://github.com/vim-airline/vim-airline'

call plug#end()

" Set Color Scheme
colorscheme nightfly

" Enable Line Numbers
:set number
