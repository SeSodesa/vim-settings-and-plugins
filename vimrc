" =============================================================================
" General settings

" Set encoding to the one to rule them all

set fileencodings=utf-8
set encoding=utf-8

" A compatibility flag for Ubuntu terminal.
" Allows the arrow keys to work as in other text editors.

set nocompatible

" Change cursor when changing modes

let &t_EI = "\<esc>[2 q"  " steady block in normal mode
let &t_SR = "\<esc>[3 q"  " steady underline in replace mode
let &t_SI = "\<esc>[6 q"  " steady I-beam in insert mode

" Filetype detection, indentation scripts and filetype plugins on

filetype plugin indent on

" Expands tabs to 4 spaces while moving the cursor at the same time

set tabstop=4 shiftwidth=4 noexpandtab

" Stop disturbing preview window from popping up

set completeopt-=preview

" Prevent Vim from writing annoying swap files

set nobackup nowritebackup noswapfile

" Check for and reload external changes when Vim or the current buffer gains
" focus, and optionally, auto-save when leaving focus.

autocmd FocusGained,BufEnter * :silent! checktime
autocmd FocusLost,WinLeave * :silent! w

" For displaying whitespace

set listchars=tab:──┤,trail:·,extends:→,precedes:←,nbsp:␣
set list

" Removes trailing whitespace on save, preserving cursor state

function! PreserveCursorPositionWithCommand(command)
	" Save current view.
	let current_view = winsaveview()
	" Execute input command without modifying command history
	keeppatterns execute a:command
	" Restore previous search history, and cursor position
	call winrestview(current_view)
endfunction

autocmd BufWritePre * call PreserveCursorPositionWithCommand("%s/\\s\\+$//e")

" Word wrapping

set wrap

" Show file title in terminal window header

set title

" Allow changing files without saving changes first. The unsaved changes can
" still be accessed by typing :ls and then :b[N], where [N] is the number of a
" buffer.

set hidden

" Remove extra spaces after joining lines ending with '!', '?', or '.'.

set nojoinspaces

" Allows the use of the backspace key to delete symbols
" over line boundaries.

set backspace=indent,eol,start

" Highlight searched patterns

set hlsearch

" Prevent moving of cursor when searching for word under it.

nnoremap * *N

" Displays line numbers

set number

" Sets the width of the line number indentation

set numberwidth=2

" Show status bar with the color of CursorColumn

set statusline=
set statusline+=%#StatusLine#
set statusline+=%F
set statusline+=%=
set statusline+=\[%{&fileencoding?&fileencoding:&encoding}\]
set statusline+=\[%{&fileformat}\]
set statusline+=\[%p%%\]
set statusline+=\[%l/%L:%c\]

" Always show status bar

set laststatus=2

" Shortcuts for navigating between buffers (files)

nnoremap <C-Left> :bprev<CR>
nnoremap <C-Right> :bnext<CR>
nnoremap <C-j> :bprev<CR>
nnoremap <C-k> :bnext<CR>

" Allow moving the cursor to arbitrary positions in a buffer, even outside of
" typed characters, in all states.

set virtualedit=

" To supplement virtualedit, prevent move to start of line at screen switch

set nostartofline

" Prevent line breaks in the middle of words

set linebreak

" Set movement to happen per screen-line when line wrapping is on

nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
vnoremap <expr> j v:count ? 'j' : 'gj'
vnoremap <expr> k v:count ? 'k' : 'gk'
nnoremap <expr> <Down> v:count ? 'j' : 'gj'
nnoremap <expr> <Up> v:count ? 'k' : 'gk'
vnoremap <expr> <Down> v:count ? 'j' : 'gj'
vnoremap <expr> <Up> v:count ? 'k' : 'gk'
inoremap <expr> <Down> v:count ? '<Down>' : '<C-o>gj'
inoremap <expr> <Up> v:count ? '<Up>' : '<C-o>gk'

" -----------------------------------------------------------------------------
" Default settings for files

autocmd FileType * set tabstop=4 shiftwidth=4 noexpandtab autoindent textwidth=78


" -----------------------------------------------------------------------------
" LaTeX

let g:latex_indent_enabled = 1
let g:latex_fold_envs = 0
let g:latex_fold_sections = []

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" Disable all LaTeΧ code folding

let Tex_FoldedSections=""
let Tex_FoldedEnvironments=""
let Tex_FoldedMisc=""

" VimTeX features.

let g:vimtex_compiler_enabled=0
let g:vimtex_syntax_conceal_disable=1
let g:vimtex_view_enabled=0

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
" JSON

autocmd Filetype json setlocal sw=2 ts=2 sts=2

" -----------------------------------------------------------------------------
"  Matlab

autocmd Filetype matlab setlocal expandtab sw=4 ts=4 sts=4 nowrap

" Zig

let g:zig_fmt_autosave = 0

" -----------------------------------------------------------------------------
" Choose color theme

" Set syntax highlighting on

syntax on

" Choose background colorscheme (dark|light)

set background=dark

" " → everforest
"
" packadd! everforest
"
" " Important!!
"
" if has('termguicolors')
"   set termguicolors
" endif
"
" " For light version.
"
" set background=light
"
" " Set contrast.
" " This configuration option should be placed before `colorscheme everforest`.
" " Available values: 'hard', 'medium'(default), 'soft'
" let g:everforest_background = 'hard'

colorscheme santun_värit

" -----------------------------------------------------------------------------
" A.L.E

let g:ale_linters = {'rust' : ['analyzer']}
let g:ale_rust_rls_toolchain = 'stable'
let g:ale_completion_enabled = 1
let g:ale_cpp_cc_options = '-std=c++17 -Wall'
let g:ale_enabled = 0

" -----------------------------------------------------------------------------
" Netrw

" Use list style directory view

let g:netrw_liststyle = 0

" Keep the current directory and the browsing directory synced.

let g:netrw_keepdir = 0

" Change the size in % of the Netrw window when it creates a split.

let g:netrw_winsize = 30

" Hide the banner. To show it, use I inside Netrw.

let g:netrw_banner = 0

" Hide dotfiles on load.

let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
