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
set listchars=tab:▸\ ,eol:¬
set linebreak
set showbreak=\ …\
set scrolloff=3
set foldmethod=indent
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

"set statusline=%F\ %m\ %r%(\ %h\ %)%y\ line\ %l\ col\ %v\ %p%%\ %L\ lines\ \ %{fugitive#statusline()}
set laststatus=2
let g:Powerline_symbols = 'fancy'

" 256 color mode brah
" requires iTerm2 or some stupid SIMBL hack
" or maybe lion's terminal? no one's sure.
"set t_Co=256
"set background=dark
"colorscheme molokai
"hi IndentGuides guibg=#373737

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

" syntax check current file
nmap <Leader>ps :!php -l %<CR>

let g:snips_author="J. Gregg Thomason <gregg.thomason@asti-usa.com>"

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

autocmd BufNewFile,BufRead *.py setlocal textwidth=79
au FileType python setlocal omnifunc=pythoncomplete#Complete

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

let twitvim_browser_cmd="open"
nnoremap <F8> :FriendsTwitter<cr>
nnoremap <F5> :RefreshTwitter<cr>
nnoremap <S-F8> :UserTwitter<cr>
nnoremap <A-F8> :RepliesTwitter<cr>
nnoremap <C-F8> :DMTwitter<cr>
let twitvim_filter_enable = 1
" remove getglue links
let twitvim_filter_regex = '@GetGlue'
let twitvim_count = 50

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

" derp 5f5f5f
let g:indentguides_state = 0
function! IndentGuides()
    if g:indentguides_state
        let g:indentguides_state = 0
        2match None
    else
        let g:indentguides_state = 1
        execute '2match IndentGuides /\%(\_^\s*\)\@<=\%(\%'.(0*&sw+1).'v\|\%'.(1*&sw+1).'v\|\%'.(2*&sw+1).'v\|\%'.(3*&sw+1).'v\|\%'.(4*&sw+1).'v\|\%'.(5*&sw+1).'v\|\%'.(6*&sw+1).'v\|\%'.(7*&sw+1).'v\)\s/'
    endif
endfunction
nnoremap <leader>i :call IndentGuides()<cr>

let g:yankring_history_dir = '$HOME/.vim/tmp'
let g:yankring_history_file = 'yankring_history_file'

nnoremap <leader>ft mZggVG=`Zzz
nnoremap H 0
nnoremap L $
