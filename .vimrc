" vim:fdm=marker

" Vundle {{{
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" My Bundles
Bundle 'vim-scripts/phpfolding.vim'
Bundle 'vim-scripts/PDV--phpDocumentor-for-Vim'
Bundle 'vim-scripts/errormarker.vim'
Bundle 'bpearson/vim-phpcs'
Bundle 'joonty/vim-xdebug.git'
Bundle 'vim-ruby/vim-ruby'
Bundle 'ngmy/vim-rubocop'
Bundle 'hallettj/jslint.vim'

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
set tags+=tags;
" }}}

" Xdebug {{{
" Listener port
let g:debuggerPort=9000
" }}}
