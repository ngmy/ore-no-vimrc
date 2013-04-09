" vim:fdm=marker

" Syntax highlighting in strings {{{
" SQL
let php_sql_query=1

" HTML
let php_htmlInStrings=1
" }}}

" PHP_CodeSniffer {{{
" Coding standard to use
let Vimphpcs_Standard='PEAR'
" }}}

" Flymake {{{
setlocal makeprg=$HOME/.vim/bin/vimparse.php\ -c\ %\ $*
autocmd BufWritePost * silent make
autocmd QuickfixCmdPost make redraw!
autocmd QuickfixCmdPost make if len(getqflist()) != 0 | copen | endif
autocmd QuickfixCmdPost make if len(getqflist()) == 0 | cclose | endif
" }}}
