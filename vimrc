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
set foldmethod=marker 
set showcmd " see commands as you type them

set statusline=%F\ %m\ %r%(\ %h\ %)%y\ line\ %l\ col\ %v\ %p%%\ %L\ lines\ \ %{fugitive#statusline()}
 
autocmd bufwritepost .vimrc source $MYVIMRC

if has('gui_running')
    set background=dark
else
    set background=light
endif

set ruler
set hidden " switch to new buffers w/o having to use !
syntax enable

" fix PHP things
au FileType php set omnifunc=phpcomplete#CompletePHP
"""""let php_folding=1 " OMG DO NOT EVER ENABLE THIS
let php_sql_query=1
let php_baselib=1
let php_htmlInStrings=1

" syntax check current file
nmap <Leader>ps :!php -l %<CR>

" tag list stuff
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
let Tlist_WinWidth = 40
let Tlist_Show_One_File=1
let Tlist_Auto_Update=1
map <F4> :TlistToggle<cr>

let g:snips_author="J. Gregg Thomason <gregg@buzzcart.com>"

" :help bufexplorer for more
map <F3> :BufExplorer<CR>

" retain view state when switching windows
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview



"let g:CommandTMaxHeight=20

