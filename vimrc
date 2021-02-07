" A compatibility flag for ubuntu terminal
" Allows the arrow keys to work as in other text editors
set nocompatible

" Allows the use of the backspace key to delete symbols across line boundaries
set backspace=indent,eol,start

" Exands tabs to 4 spaces while moving the cursor at the same time
set tabstop=4 shiftwidth=4 expandtab

" Displays line numbers
set number

" Sets the width of the line number indentation
set numberwidth=2

" Changes colorscheme
colorscheme koehler

" Removes trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" For displaying whitespace
set listchars=tab:>·,trail:·,extends:>,precedes:<,nbsp:␣
set list

