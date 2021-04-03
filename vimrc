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

" Shortcuts for navigating between buffers (files)
nnoremap <C-Left> :bprev<CR>
nnoremap <C-Right> :bnext<CR>
nnoremap <C-j> :bprev<CR>
nnoremap <C-k> :bnext<CR>

" Activates the onedark theme
packadd! onedark.vim

" A.L.E settings
let g:ale_rust_rls_toolchain = 'stable'
let g:ale_completion_enabled = 1

" Filetype detection, indentation scripts and filetype plugins on
filetype plugin indent on
set completeopt-=preview

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" Activates the julia-vim unicode completions for all file types
" Warning: overrides omnifunc settings for all file types when done like this
let g:latex_to_unicode_file_types = ".*"

" Changes colorscheme
syntax on
colorscheme onedark


" Removes trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" For displaying whitespace
set listchars=tab:␉·,trail:·,extends:>,precedes:<,nbsp:␣
set list

" Set file encodings to utf-8, the only acceptable encoding
set fileencodings=utf-8
set encoding=utf-8
