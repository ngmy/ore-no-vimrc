" vim:fdm=marker

" Syntax highlighting in strings {{{
" SQL
let php_sql_query=1

" HTML
let php_htmlInStrings=1
" }}}

" PHP_CodeSniffer {{{
" Coding standard to use
let Vimphpcs_Standard='PSR2'
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
autocmd BufWritePost <buffer> silent make
autocmd QuickfixCmdPost make redraw!
autocmd QuickfixCmdPost make if len(getqflist()) != 0 | copen | endif
autocmd QuickfixCmdPost make if len(getqflist()) == 0 | cclose | endif
" }}}

" phpcomplete-extended {{{
" Composer command name.
let g:phpcomplete_index_composer_command = 'composer'
" PHP omni completion.
"autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP
" }}}

" Omni completion {{{
set omnifunc=syntaxcomplete#Complete
" }}}

" Ctags {{{
set tags+=php.tags
" }}}

" vim-ref {{{
let g:ref_phpmanual_path = $HOME.'/.vim/ref/php-chunked-xhtml'
" }}}

"phpfolding {{{
source $HOME/.vim/bundle/phpfolding.vim/plugin/phpfolding.vim
" }}}
