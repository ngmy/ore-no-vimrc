" vim:fdm=marker

" Vundle {{{
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Plugin 'VundleVim/Vundle.vim'

" My Plugins
"Plugin 'vim-scripts/phpfolding.vim'
Plugin 'vim-scripts/PDV--phpDocumentor-for-Vim'
Plugin 'vim-scripts/errormarker.vim'
"Plugin 'bpearson/16im-phpcs'
"Plugin 'joonty/vim-xdebug.git'
Plugin 'joonty/vdebug'
Plugin 'vim-ruby/vim-ruby'
"Plugin 'ngmy/vim-rubocop'
"Plugin 'hallettj/jslint.vim'
Plugin 'Shougo/neocomplete.vim'
"Plugin 'violetyk/neocomplete-php.vim'
Plugin 'thinca/vim-ref'
Plugin 'aklt/plantuml-syntax'
Plugin 'tpope/vim-fugitive'
Plugin 'Shougo/vimproc.vim'
"Plugin 'm2mdas/phpcomplete-extended'
"Plugin 'm2mdas/phpcomplete-extended-laravel'
"Plugin 'soramugi/auto-ctags.vim'
Plugin 'gregsexton/gitv'
"Plugin 'fatih/vim-go'
"Plugin 'jodosha/vim-godebug'
Plugin 'davidhalter/jedi-vim'
Plugin 'file:///Users/nagamiya/usr/local/src/ijaas'

filetype plugin indent on
" }}}

" Editor {{{
" Enable syntax highlighting
syntax on

" Display line numbers
set number

" Disable ward wrapping
set nowrap

" Enable incremental search
set incsearch

" Highlighting search results
set hlsearch

" Highlighting cursor line
set cursorline
set cursorcolumn

" Highlighting more than 80 characters
if exists('&colorcolumn')
  set colorcolumn=80
endif

" Display status line
set laststatus=2

" Disable omnifunc preview window
set completeopt=menuone
" }}}

" Text editing defualts {{{
" Display multi-byte characters correctly
if exists('&ambiwidth')
  set ambiwidth=double
endif

" Highlighting tabs and unwanted spaces
set list
set listchars=tab:>>,extends:<,trail:-
highlight SpecialKey ctermfg=lightblue ctermbg=blue guifg=lightblue guifg=blue

" Highlighting zenkaku-spaces
highlight ZenkakuSpace cterm=underline ctermfg=lightblue ctermbg=blue gui=underline guifg=blue guibg=blue
match ZenkakuSpace /　/

" Erasing previously entered characters in insert mode
set backspace=indent,eol,start
" }}}

" Ctags {{{
" Search recursively upwards for the tags file
set tags+=php.tags;
" }}}

" Xdebug {{{
" Listener port
let g:debuggerPort=10000
" }}}

" neocomplete {{{
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
\    'default' : '',
\    'vimshell' : $HOME.'/.vimshell_hist',
\    'scheme' : $HOME.'/.gosh_completions'
\}

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting./
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

inoremap <expr><C-p> neocomplete#start_manual_complete()
" }}}

" vim-ref {{{
let g:ref_phpmanual_path = $HOME.'/.vim/ref/php-chunked-xhtml'
" }}}

" plantuml {{{
let g:plantuml_executable_script = $HOME.'/.vim/bin/plantuml'
" }}}

" vim-fugitive {{{
" Display git branch name to status line
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
" }}}

" phpcomplete-extended {{{
" Composer command name.
let g:phpcomplete_index_composer_command = 'composer'
 " }}}

" Vdebug {{{
" Use the brew python install
let s:python_path = system('/usr/local/bin/python -', 'import sys;sys.stdout.write(",".join(sys.path))')

python <<EOM
import sys
import vim

python_paths = vim.eval('s:python_path').split(',')
for path in python_paths:
    if not path in sys.path:
        sys.path.insert(0, path)
EOM

" options
let g:vdebug_options = {
\    "port" : 10000,
\    "server" : '192.168.100.92',
\    "path_maps" : { '/var/app/src': '/Users/nagamiya/localrepos/github.com/WHITEPLUS/lenet' },
\}
" }}}
