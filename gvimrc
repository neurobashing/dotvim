set guifont=Menlo:h12
set guioptions-=T

syntax enable
"colorscheme solarized
colorscheme ir_black

autocmd bufwritepost .gvimrc source $MYVIMRC

if has("gui_macvim")
    macmenu &File.New\ Tab key=<nop>
    map <D-t> :CommandT<CR>
endif

