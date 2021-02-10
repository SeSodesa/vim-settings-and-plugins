" A compatibility flag for Ubuntu terminal.
" Allows the arrow keys to work as in other text editors.
set nocompatible

" Allows the use of the backspace key to delete symbols
" over line boundaries.
set backspace=indent,eol,start

" Expands tabs to 4 spaces while moving the cursor at the same time
set tabstop=4 shiftwidth=4 expandtab

" Displays line numbers
set number

" Sets the width of the line number indentation
set numberwidth=2

" Activates the onedark theme
packadd! onedark.vim

" Changes colorscheme
colorscheme onedark

" Activates the julia-vim unicode completions for all file types
" Warning: overrides omnifunc settings for all file types when done like this
let g:latex_to_unicode_file_types = ".*"

" Removes trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" For displaying whitespace
set listchars=tab:␉·,trail:·,extends:>,precedes:<,nbsp:␣
set list
