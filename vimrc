call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype on
filetype plugin on
filetype plugin indent on

if has('gui_running')
    set background=light
else
    set background=dark
endif

