"set guifont=Inconsolata:h14
set guifont=Menlo:h14
"set guioptions-=T

syntax enable
"colorscheme macvim
colorscheme zenburn
"colorscheme solarized
"colorscheme ir_black

autocmd bufwritepost .gvimrc source $MYVIMRC

if has("gui_macvim")
    macmenu &File.New\ Tab key=<nop>
    map <D-t> :CommandT<CR>
    let g:CommandTMaxHeight=20
    set fuoptions=maxhorz,maxvert
    " Command-Return for fullscreen
    macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>
    " Command-Shift-F for Ack
    map <D-F> :Ack<space>
    macmenu &Tools.Make key=<nop>
    map <D-b> :CommandTBuffer<CR>
    map <Leader>tb :TagbarToggle<CR>
endif

" let's fiddle with the toolbar.
" remove the Make button, because we don't Make.
aunmenu ToolBar.Make

" Add a button for toggling Tagbar
tmenu ToolBar.TagBar Toggle Tagbar
amenu ToolBar.TagBar :TagbarToggle<CR>

tmenu ToolBar.VimWiki Open wiki Index
amenu ToolBar.VimWiki :VimwikiIndex<CR>

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

