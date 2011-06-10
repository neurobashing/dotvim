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

" 256 color mode brah
" requires iTerm2 or some stupid SIMBL hack
set t_Co=256
colorscheme zenburn

autocmd bufwritepost .vimrc source $MYVIMRC

if has('gui_running')
    set background=light
else
    set background=dark
endif

set ruler
set hidden " switch to new buffers w/o having to use !
syntax enable

" fix PHP things
au FileType php set omnifunc=phpcomplete#CompletePHP
"let php_folding=1 " OMG DO NOT EVER ENABLE THIS
let php_sql_query=1
let php_baselib=1
let php_htmlInStrings=1

" replicate cmd-[ and cmd-] (eg from bbedit) 
" to move visual selection
vmap <D-[> <gv
vmap <D-]> >gv

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

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <F2> :NERDTreeToggle<CR>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

au FileType make set noexpandtab
au FileType snippet setlocal ts=8 sts=8 sw=8 noet


"let g:CommandTMaxHeight=20

" Don't screw up folds when inserting text that might affect them, until
" " leaving insert mode. Foldmethod is local to the window. Protect against
" " screwing up folding when switching between windows.
 "autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
 "autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
 
" Command-/ to toggle comments
map <D-/> <plug>NERDCommenterToggle<CR>
imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i
 
" use a different vimwiki path
let g:vimwiki_list = [{'path': '~/.vim/vimwiki/', 'path_html': '~/Sites/vimwiki/'}]

" in theory this will fix fugitive problems
set shell=/bin/bash

" macro to change config strings in php
let @l='w2xi->~w4xi->ww2x'
" macro to change config strings in smarty templates
let @s='wcw->ESCl~wcw->ESC'
" macro to change sql_tbl stuff to buzzcart_
let @d="/$sql^M3cwbuzzcart_ESCwx"

