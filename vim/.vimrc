""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  PLUGINS                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()

" Snippets engine and snippets repo
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Emmet plugin for Ultisnips
Plug 'adriaanzon/vim-emmet-ultisnips'

" Gruvbox colorscheme
Plug 'gruvbox-community/gruvbox'

" One dark colorscheme
Plug 'joshdick/onedark.vim'

" Autocompletion plugin and its dependencies
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

call plug#end()




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               BASIC SETTINGS                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use :help <subject> to know more about the setting (E.g. :help nowrap)

filetype plugin indent on
set autoindent
set completeopt=menuone,preview,noinsert
let g:deoplete#enable_at_startup = 1
set nowrap
set number relativenumber
set path+=**
set shortmess+=c
set tabstop=8 softtabstop=4 shiftwidth=4 expandtab

let mapleader = ";"
let maplocalleader = "\<space>"




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   COLORS                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Fix colors
if (has("termguicolors"))
" https://github.com/vim/vim/issues/993#issuecomment-255651605
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

        set termguicolors
endif

" Use Gruvbox colorscheme
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_light='hard'




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  MAPPINGS                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use jk to exit insert more
inoremap jk <esc>

" Make <Tab> snippet, insert selected autocompletion candidate or normal <tab>
inoremap <buffer> <tab> <c-r>=(UltiSnips#CanExpandSnippet() ? UltiSnips#ExpandSnippet() : pumvisible() ? "\r" : "\t" )<cr>

" Move lines up("_") and down("-")
nnoremap - ddp
nnoremap _ dd2kp

" Edit .vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Source my .vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr>

" Use H and L to move between start and end of the lines
nnoremap H 0
nnoremap L $
