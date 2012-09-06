"set guifont=Inconsolata:h14
"set guifont=Menlo:h14
"set guifont=Menlo\ Regular\ for\ Powerline:h14
set guifont=Ubuntu\ Mono:h16
" disable the toolbar
" set guioptions-=T

set t_Co=256
syntax enable
"set background=light
"colorscheme macvim

set background=dark
colorscheme jellybeansg

"colorscheme zenburn
"colorscheme xoria256
"colorscheme solarized
"colorscheme ir_black
"colorscheme molokai
" this sucks.
hi IndentGuides guibg=#FFFFFF
"hi IndentGuides guibg=#373737

"set statusline+=\ %{fugitive#statusline()}

autocmd bufwritepost .gvimrc source $MYVIMRC

if has("gui_macvim")
    "macmenu &File.New\ Tab key=<nop>
    "map <D-t> :PeepOpen<CR>
    "macmenu &File.Open\ Tab\.\.\. key=<nop>
    map <D-T> :tabe
    set fuoptions=maxhorz,maxvert
    " Command-Return for fullscreen
    "macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>
    macmenu Window.Toggle\ Full\ Screen\ Mode key=<nop>
    " Command-Shift-F for Ack
    map <D-F> :Ack<space>
    macmenu &Tools.Make key=<nop>
    map <Leader>tb :TagbarToggle<CR>

    "macmenu Window.Select\ Next\ Tab key=<nop>
    "macmenu Window.Select\ Previous\ Tab key=<nop>
    "map <D-{> :bp<cr>
    "map <D-}> :bn<cr>

    "macmenu File.Close key=<nop>
    "map <D-w> :bw<cr>
endif

" let's fiddle with the toolbar.
" remove the Make button, because we don't Make.
aunmenu ToolBar.Make

" Add a button for toggling Tagbar
tmenu ToolBar.TagBar Toggle Tagbar
amenu ToolBar.TagBar :TagbarToggle<CR>

tmenu ToolBar.VimWiki Open wiki Index
amenu ToolBar.VimWiki :VimwikiIndex<CR>

" Add git thingees here

" Show syntax highlighting groups for word under cursor
"nmap <C-S-P> :call <SID>SynStack()<CR>
"function! <SID>SynStack()
  "if !exists("*synstack")
    "return
  "endif
  "echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
"endfunc

