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

" phpDocumentor {{{
inoremap <C-O> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-O> :call PhpDocSingle()<CR>
vnoremap <C-O> :call PhpDocRange()<CR>
let g:pdv_cfg_Package = ''
let g:pdv_cfg_Version = ''
let g:pdv_cfg_Author = ''
let g:pdv_cfg_Copyright = ''
let g:pdv_cfg_License = ''
" }}}

" Flymake {{{
setlocal makeprg=$HOME/.vim/bin/vimparse.php\ -c\ %\ $*
autocmd BufWritePost * silent make
autocmd QuickfixCmdPost make redraw!
autocmd QuickfixCmdPost make if len(getqflist()) != 0 | copen | endif
autocmd QuickfixCmdPost make if len(getqflist()) == 0 | cclose | endif
" }}}
