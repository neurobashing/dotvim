call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype on
filetype plugin on
filetype plugin indent on

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
