filetype off
call pathogen#infect()

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
set listchars=tab:▸\ ,eol:¬
set linebreak
set showbreak=\ …\
set scrolloff=3
"set foldmethod=indent
set showcmd " see commands as you type them

set ignorecase
set smartcase
" these two make searches case-insensitive UNLESS you search for a mixed case word
set gdefault " substitute globally by default, append g to invert
" show matches, highlight results in real time
set showmatch
set hlsearch
" leader-space clears highlighting.
nnoremap <leader><space> :noh<cr>
" searches by default use extra-magic (or "normal") regular expressions
nnoremap / /\v
vnoremap / /\v

set laststatus=2

set t_Co=256
set background=dark
colorscheme jellybeans

autocmd bufwritepost .vimrc source $MYVIMRC

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

let g:snips_author="J. Gregg Thomason <gregg.thomason@asti-usa.com>"

"" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$', '\.bbprojectd$', '\.komodotools', '\.swp$', '\.git', '\.hg', '\.svn']
map <Leader>nt :NERDTreeToggle<CR>
"autocmd vimenter * NERDTree
" 1 means chdir to whatever nerd tree is started in, 2 means chdir as you
" navigate
let NERDTreeChDirMode=0
" close after opening a file.
let NERDTreeQuitOnOpen=1
" single click will open directory nodes, while a double
" click will still be required for file nodes. 3 for anything-single-click
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" Remember last location in file
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal g'\"" | endif
endif

au FileType make set noexpandtab
au FileType snippet setlocal ts=8 sts=8 sw=8 noet

" in theory this will fix fugitive problems
set shell=/bin/bash

"let g:tagbar_ctags_bin="/usr/local/bin/ctags"
"nnoremap <D-Y> :TagbarToggle<cr>

command W w
command Wb w|bw

autocmd BufNewFile,BufRead *.py setlocal textwidth=79
au FileType python setlocal omnifunc=pythoncomplete#Complete

autocmd BufNewFile,BufRead *.js setlocal textwidth=79 ts=2 sts=2 sw=2
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" markdown yo
nnoremap <leader>M :silent !open -a Marked.app '%:p'<cr>

set wildmenu
set wildmode=longest,full
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.pyc                            " Python byte code

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" in theory, this will delete all empty buffers
function! DeleteEmptyBuffers()
    let empty = []
    let [i, nbuf] = [1, bufnr('$')]
    while i <= nbuf
        if bufexists(i) && bufname(i) == ''
            let empty += [i]
        endif
        let i += 1
    endwhile
    if len(empty) > 0
        execute 'bdelete ' . join(empty, ' ')
    endif
endfunction

let g:session_autoload = 'no'

" Keep search matches in the middle of the window and pulse the line when moving
" to them.
nnoremap n nzzzv
nnoremap N Nzzzv
" Heresy, use emacs bindings in insert mode
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A

" format current buffer
nnoremap <leader>ft mZggVG=`Zzz
nnoremap H 0
nnoremap L $

" map leader-O to "make the current window the only window
nnoremap <leader>O :only<cr>

" stolen from Janus
if has("gui_running")
    if has("autocmd")
        " Automatically resize splits when resizing MacVim window
        autocmd VimResized * wincmd =
    endif
endif
set backupdir=~/.vim/_backup/
set directory=~/.vim/_tmp/

let vimpager_use_gvim = 1
let vimpager_scrolloff = 0
