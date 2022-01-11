" Basic Settings ---------------------- {{{
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

" Disable autocomments by Vim
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" }}}
" Mappings ---------------------- {{{
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

" Use jk to exit insert mode
inoremap jk <esc>

" Use <space> to toggle folds
nnoremap <space> za

" Smart-Tab function, let it tab and autocomplete(insert mode)
function! CleverTab()
	if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
		return "\<Tab>"
	else
		return "\<C-N>"
	endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

" Return in normal mode jumps to placeholder
inoremap <c-j> <esc>/<++><cr>vf>c
" Former CleverReturn() Function {{{
function! CleverReturn()
	if strpart( getline('.'), col('.')+1) =~ '^\s*$'
		return "\<enter>"
	elseif search('<++>', 'n', line("w$"))
		return "\<esc>/<++>\<cr>vf>c"
	else
		return "\<enter>"
	endif
endfunction
" }}}
" }}}
" Filetype-specific settings ---------------------- {{{
" Add and remove comments
augroup commentbind
	autocmd!
	" HTML
	autocmd BufNewFile,BufRead *.html nnoremap <buffer> <localleader>c I<!-- <esc>A --><esc>
	autocmd BufNewFile,BufRead *.html nnoremap <buffer> <localleader>uc $xxxx0f<h6x
	" JS
	autocmd FileType javascript nnoremap <buffer> <localleader>c I// <esc>
	autocmd FileType javascript nnoremap <buffer> <localleader>uc 0v2ld
	" CSS
	autocmd BufNewFile,BufRead *.css nnoremap <buffer> <localleader>c I/* <esc>A */<esc>
	autocmd BufNewFile,BufRead *.css nnoremap <buffer> <localleader>uc $xxx0f/xxx 
	" VIML
	autocmd FileType vim nnoremap <buffer> <localleader>c I" <esc>
	autocmd FileType vim nnoremap <buffer> <localleader>uc 0vld
augroup end

" Reindent html, css and js files when opening one
augroup indentgroup
	autocmd!
	autocmd BufWritePre,BufRead *.html,*.css,*.js :normal gg=G
augroup end

" HTML template
augroup templategroup
	autocmd!
	au BufNewFile *.html 0read ~/.vim/templates/skeleton.html
augroup end

" HTML autocomplete words
augroup autocomplwords
	autocmd!
	au BufNewFile,BufRead *.html set cpt=k~/.vim/autocomplete/html.txt,i
augroup end

" javascript function abbreviation
augroup functionabbrev
	autocmd!
	au Filetype javascript :iabbrev fun function (<++>) {<cr><++><cr>}<cr><++><esc>3k0f(i
	au BufNewFile,BufRead *.vim :iabbrev fun function! ()<cr><++><cr>endfunction<cr><++><esc>3k0f(i
augroup end

" vimscript if statement abbreviation
augroup ifabbrev
	autocmd!
	au BufNewFile,BufRead *.vim :iabbrev iff if<cr><++><cr>endif<cr><++><esc>3k0A
augroup end

augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" CSS better-brackets
augroup better_brackets
	autocmd!
	autocmd BufNewFile,BufRead *.css :iabbrev <buffer> { {<cr>}<cr><cr><++><esc>3kA
augroup END
" }}}
