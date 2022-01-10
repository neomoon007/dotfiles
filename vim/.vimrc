" Make it work like Vim, not Vi
set nocompatible
filetype off

" Make it wrap the lines
set wrap

" Makes vim recognise vundle
set runtimepath+=~/.vim/bundle/Vundle.vim

" Calls for the plugins
call vundle#begin('~/.vim/improvments')

Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'myusuf3/numbers.vim'

call vundle#end()

filetype plugin indent on
" Make it work as vim and not vi

" Set gruvbox colorscheme
colorscheme gruvbox
set background=dark

" Set line numbers
set number relativenumber 

" Enable syntax highlighting
syntax enable

" Set tab width equals 4 spaces
set shiftwidth=2
set tabstop=2

" Let you tab-complete file paths
set path+=**

" Shows you all matching files when we tab-complete
set wildmenu

" Set Leader and Local Leader
let mapleader = ";"
let maplocalleader = "\\"

" Automatic closing brackets
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

" Auto <> closing tag in HTML
au BufNewFile,BufRead *.html inoremap < <><left>

" Move lines down(-) and up(_)
noremap - ddp
noremap _ dd2kp

" Uppercase the current word
inoremap <leader>u <esc>viwU<esc>i
nnoremap <leader>u viwU<esc>

" Edit $MYVIMRC file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Source $MYVIMRC file
nnoremap <leader>sv :source $MYVIMRC<cr> 

" Abbreviations
iabbrev @@ costamarcos404@gmail.com
iabbrev ccopy Copyright 2022 Marcos Costa, all rights reserved.

" Spawn dummy text
nnoremap <leader>dm :read ~/.vim/templates/dummy.txt<cr>

" Put double and single quotes surrounding the current word
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

" Put double and single quotes surrounding the current visual selection
vnoremap <leader>" xi""<esc>hp
vnoremap <leader>' xi''<esc>hp

" Moving faster with H and L
nnoremap H 0
nnoremap L $

" Disable arrow keys
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>

" Disable Esc in Insert Mode, use jk instead
inoremap <esc> <nop>
inoremap jk <esc>

" Add and remove comments
" HTML
autocmd BufNewFile,BufRead *.html nnoremap <buffer> <localleader>c I<!-- <esc>A --><esc>
autocmd BufNewFile,BufRead *.html nnoremap <buffer> <localleader>uc 0/- <cr>lv0d$v3hd
" JS
autocmd FileType javascript nnoremap <buffer> <localleader>c I// <esc>
autocmd FileType javascript nnoremap <buffer> <localleader>uc 0v2ld
" CSS
autocmd BufNewFile,BufRead *.css nnoremap <buffer> <localleader>c I/* <esc>A */<esc>
autocmd BufNewFile,BufRead *.css nnoremap <buffer> <localleader>uc 0v2ld$v2hd

au BufNewFile *.html 0read ~/.vim/templates/skeleton.html

" Smart-Tab function, let it tab, autocomplete(insert mode) and jump to next
" placeholder <++>
function! CleverTab()
	if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
		return "\<Tab>"
	elseif search('<++>', 'n', line("w$"))
		return "\<esc>/<++>\<cr>ciw"
	else
		return "\<C-N>"
	endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

" html autocomplete words
au BufNewFile,BufRead *.html set cpt=k~/.vim/autocomplete/html.txt,i
