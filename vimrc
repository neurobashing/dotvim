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
set listchars=tab:▸\ ,eol:¬
set linebreak
set showbreak=\ …\
set scrolloff=3
set foldmethod=marker
set showcmd " see commands as you type them

" here's some new stuff I'm trying out
let mapleader = ","
set ignorecase
set smartcase
" these two make searches case-insensitive UNLESS you search for a mixed case
" word
set gdefault " substitute globally by default, append g to invert
" show matches, highlight results in real time
set showmatch
set hlsearch
" leader-space clears highlighting.
nnoremap <leader><space> :noh<cr>
" searches by default use extra-magic (or "normal") regular expressions
nnoremap / /\v
vnoremap / /\v

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

let g:snips_author="J. Gregg Thomason <gregg@buzzcart.com>"

" retain view state when switching windows
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

"" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
"map <F2> :NERDTreeToggle<CR>
map <Leader>nt :NERDTreeToggle<CR>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

au FileType make set noexpandtab
au FileType snippet setlocal ts=8 sts=8 sw=8 noet

" Command-/ to toggle comments
map <D-/> <plug>NERDCommenterToggle<CR>
imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i

" use a different vimwiki path
" you can use more path/path_html {} pairs.
let g:vimwiki_list = [{'path': '~/.vim/vimwiki/', 'path_html': '~/Sites/vimwiki/'}]

" in theory this will fix fugitive problems
set shell=/bin/bash

let g:tagbar_ctags_bin="/usr/local/bin/ctags"

" show tasklist for current file
map <leader>lt <Plug>TaskList

command W w
command Wb w|bw

nnoremap <leader>M :silent !open -a Marked.app '%:p'<cr>

