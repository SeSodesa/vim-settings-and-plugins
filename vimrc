" A compatibility flag for Ubuntu terminal.
" Allows the arrow keys to work as in other text editors.
set nocompatible

" Set file encodings to utf-8, the only acceptable encoding
set fileencodings=utf-8
set encoding=utf-8

" Prevent Vim from writing annoying swap files
set nobackup nowritebackup noswapfile

" Prevent word wrapping
set nowrap

" Show file title in terminal window header
set title

" Allow changing files without saving changes first.
" The unsaved changes can still be accessed by typing
" :ls and then :b[N], where [N] is the number of a buffer.
set hidden

" Remove extra spaces after joining lines ending with '!', '?', or '.'.
set nojoinspaces

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

" A.L.E settings
let g:ale_linters = {'rust' : ['analyzer']}
let g:ale_rust_rls_toolchain = 'stable'
let g:ale_completion_enabled = 1
let g:ale_cpp_cc_options = '-std=c++17 -Wall'

" -------- LaTeX --------
let g:latex_indent_enabled = 1
let g:latex_fold_envs = 0
let g:latex_fold_sections = []

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" -------- Julia --------

" Activates the julia-vim unicode completions for all file types
" Warning: overrides omnifunc settings for all file types when done like this
let g:latex_to_unicode_file_types = ".*"

" --------- Javascript ---------

autocmd FileType javascript setlocal sw=2 ts=2 sts=2
autocmd FileType vue setlocal sw=2 ts=2 sts=2

" Filetype detection, indentation scripts and filetype plugins on
filetype plugin indent on
set completeopt-=preview

" Activates the onedark theme
" packadd! onedark.vim
packadd! vim-one

" Set syntax highlighting on
syntax on

" --------- Choose color theme ---------

" colorscheme onedark
colorscheme one

" set background=dark " for the dark version of vim-one
set background=light " for the light version of vim-one

" Removes trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" For displaying whitespace
set listchars=tab:␉·,trail:·,extends:>,precedes:<,nbsp:␣
set list

" Change cursor  when changing modes
let &t_SI = "\<esc>[6 q"  " blinking I-beam in insert mode
let &t_SR = "\<esc>[3 q"  " blinking underline in replace mode
let &t_EI = "\<esc>[2 q"  " steady block in normal mode
