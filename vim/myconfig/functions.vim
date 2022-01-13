function! Tab_AutoComplete()
	if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
		return "\<Tab>"
	else
		return "\<C-N>"
	endif
endfunction
inoremap <Tab> <C-R>=Tab_AutoComplete()<CR>

function! Comment_Uncomment_Line()
	let has_sup = Has_Comment_Support()
	if has_sup ==? "supported"
		let call_func = "call Comment_Uncomment_Line_" . &filetype . "()"
		execute call_func
	else
		echo "autocomment shotcut doesn't work on this filetype"
	endif
endfunction
nnoremap <localleader>c :call Comment_Uncomment_Line()<cr>

function! Comment_Uncomment_Line_vim()
	if matchstr( strpart( getline("."), 0, 2), "\"") ==? "\""
		execute "normal! 0vld"
	else
		execute "normal! I\" \<esc>"
	endif
endfunction

function! Has_Comment_Support()
	let supported_filetypes = ["vim", "javascript", "css", "html"]
	let stopline = len(supported_filetypes)
	let current = 0
	while current <= stopline
		if &filetype ==? supported_filetypes[current]
			return "supported"
		else
			return "not supported"
		endif
		let current += 1
	endwhile
endfunction
