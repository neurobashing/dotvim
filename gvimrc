set guifont=Inconsolata:h14
"set guifont=Menlo:h12
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

