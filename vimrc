" -----------------------------------------------------------------------------
" General settings

" Set file encodings to utf-8, the only acceptable encoding
set fileencodings=utf-8
set encoding=utf-8

" A compatibility flag for Ubuntu terminal.
" Allows the arrow keys to work as in other text editors.
set nocompatible

" Filetype detection, indentation scripts and filetype plugins on
filetype plugin indent on

" Expands tabs to 4 spaces while moving the cursor at the same time
set tabstop=4 shiftwidth=4 noexpandtab

" Stop disturbing preview window from popping up
set completeopt-=preview

" Prevent Vim from writing annoying swap files
set nobackup nowritebackup noswapfile

" Check for and reload external changes when Vim or the current buffer gains focus,
" and optionally, auto-save when leaving focus.
autocmd FocusGained,BufEnter * :silent! checktime
autocmd FocusLost,WinLeave * :silent! w

" For displaying whitespace
set listchars=tab:−−⊣,trail:·,extends:→,precedes:←,nbsp:␣
set list

" Removes trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Change cursor when changing modes
let &t_EI = "\<esc>[2 q"  " steady block in normal mode
let &t_SR = "\<esc>[3 q"  " steady underline in replace mode
let &t_SI = "\<esc>[6 q"  " steady I-beam in insert mode

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

" Displays line numbers
set number

" Sets the width of the line number indentation
set numberwidth=2

" Shortcuts for navigating between buffers (files)
nnoremap <C-Left> :bprev<CR>
nnoremap <C-Right> :bnext<CR>
nnoremap <C-j> :bprev<CR>
nnoremap <C-k> :bnext<CR>

" -----------------------------------------------------------------------------
" Default settings for files

autocmd FileType * set tabstop=4 shiftwidth=4 noexpandtab autoindent


" -----------------------------------------------------------------------------
" LaTeX

let g:latex_indent_enabled = 1
let g:latex_fold_envs = 0
let g:latex_fold_sections = []

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" -----------------------------------------------------------------------------
" Julia

" Activates the julia-vim unicode completions for all file types
" Warning: overrides omnifunc settings for all file types when done like this
let g:latex_to_unicode_file_types = ".*"

" -----------------------------------------------------------------------------
" Javascript

autocmd FileType javascript setlocal sw=2 ts=2 sts=2
autocmd FileType vue setlocal sw=2 ts=2 sts=2

" -----------------------------------------------------------------------------
" SVG

autocmd Filetype svg setlocal sw=2 ts=2 sts=2

" -----------------------------------------------------------------------------
" Choose color theme

" Set syntax highlighting on
syntax on

" → onedark.vim
" packadd! onedark.vim
"packadd! vim-one
" → onedark
" set background=dark " for the dark version of vim-one
" set background=light " for the light version of vim-one
" colorscheme one

" → tokyonight-vim
" packadd! tokyonight-vim
" set termguicolors
"let g:tokyonight_style = 'night'
" let g:tokyonight_style = storm
" let g:tokyonight_enable_italic = 1
"colorscheme tokyonight

" → Sonokai
" packadd! sonokai
" colorscheme sonokai

" → PaperColor
packadd! papercolor-theme
set background=light
colorscheme PaperColor

" -----------------------------------------------------------------------------
" A.L.E

let g:ale_linters = {'rust' : ['analyzer']}
let g:ale_rust_rls_toolchain = 'stable'
let g:ale_completion_enabled = 1
let g:ale_cpp_cc_options = '-std=c++17 -Wall'
let g:ale_enabled = 0

" -----------------------------------------------------------------------------
" Netrw

" Use tree style directory view

let g:netrw_liststyle = 3

" Keep the current directory and the browsing directory synced.

let g:netrw_keepdir = 0

" Change the size in % of the Netrw window when it creates a split.

let g:netrw_winsize = 30

" Hide the banner. To show it, use I inside Netrw.

let g:netrw_banner = 0

" Hide dotfiles on load.

let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
