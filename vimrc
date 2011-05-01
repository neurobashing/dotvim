call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype on
filetype plugin on
filetype plugin indent on

set nocp
set number
set sw=4
set softtabstop=4
set backspace=start,indent,eol
set autoindent
set smartindent
set smarttab
set expandtab
set wrap
set ls=2
set incsearch
set cursorline
set visualbell
set hidden 
set smartcase
set listchars=tab:▸\ ,eol:¬
set linebreak
set showbreak=\ …\ 
set scrolloff=3

set statusline=%F\ %m\ %r%(\ %h\ %)%y\ line\ %l\ col\ %v\ %p%%\ %L\ lines\ 
" \ %{fugitive#statusline()}
 
autocmd bufwritepost .vimrc source $MYVIMRC

if has('gui_running')
    set background=dark
else
    set background=light
endif

set ruler
set hidden " switch to new buffers w/o having to use !

" fix PHP things
au FileType php set omnifunc=phpcomplete#CompletePHP
let php_folding=1
let php_sql_query=1
let php_baselib=1
let php_htmlInStrings=1

" syntax check current file
nmap <Leader>ps :!php -l %<CR>
