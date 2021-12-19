" =============================================================================
" General settings
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

" Check for and reload external changes when Vim or the current buffer gains
" focus, and optionally, auto-save when leaving focus.
autocmd FocusGained,BufEnter * :silent! checktime
autocmd FocusLost,WinLeave * :silent! w

" For displaying whitespace
set listchars=tab:──┤,trail:·,extends:→,precedes:←,nbsp:␣
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

" Allow changing files without saving changes first. The unsaved changes can
" still be accessed by typing :ls and then :b[N], where [N] is the number of a
" buffer.
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

" Show file, row and column in status bar
set statusline+=%F\ ∣\ %l\ \:\ %c

" Always show status bar
set laststatus=2

" Shortcuts for navigating between buffers (files)
nnoremap <C-Left> :bprev<CR>
nnoremap <C-Right> :bnext<CR>
nnoremap <C-j> :bprev<CR>
nnoremap <C-k> :bnext<CR>

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
packadd! tokyonight-vim
set termguicolors
"let g:tokyonight_style = 'night'
let g:tokyonight_style = 'storm'
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

" → Sonokai
" packadd! sonokai
" colorscheme sonokai

" → PaperColor
" packadd! papercolor-theme
" set background=light
" colorscheme PaperColor

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

let g:netrw_liststyle = 1

" Keep the current directory and the browsing directory synced.

let g:netrw_keepdir = 0

" Change the size in % of the Netrw window when it creates a split.

let g:netrw_winsize = 30

" Hide the banner. To show it, use I inside Netrw.

let g:netrw_banner = 0

" Hide dotfiles on load.

let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

" -----------------------------------------------------------------------------
" Functions and their key mappings

vnoremap <F3> :call Surround("(", ")")<Enter>

" Surrounds visually selected text with a given prefix and postfix.
function! Surround(prefix, postfix)
	" get the selection
	let selection = GetVisualSelection()
	" remove selected text
	normal gv"xx
	" inserting text with prefix and postfix
	execute "normal i" . a:prefix . selection . a:postfix
endfunction

" Surrounds visually selected text with titing lines,
" until the there are enough Unicode characters to will
" the current line width.
"
" Parameters:
" 	a:1 ↦ prefix string
" 	a:2 ↦ postfix string
" 	a:1 ↦ line width
function! TitleFunction(...)
	let nargs = a:0
	if nargs > 3
		echom "TitleFunction only takes 3 arguments at most…"
		return
	endif
	" Set needed values
	let prefixchar = "─"
	let postfixchar = prefixchar
	let linewidth=&textwidth
	" Reset them if values were given
	if nargs >= 1
		let prefixchar = a:1
	endif
	if nargs >= 2
		let postfixchar = a:2
	endif
	if nargs == 3
		let linewidth = a:3
	endif
	" Get the selection and calculate lengths
	let selection = trim(GetVisualSelection())
	let selection_length = strchars(selection)
	let titlebar_length = (linewidth - selection_length - 2) / 2
	" Two more lengths
	let prefix_repetitions = titlebar_length / strchars(prefixchar)
	let postfix_repetitions = titlebar_length / strchars(postfixchar)
	" Check for emptiness of current an previous lines
	let current_line = getcurpos()[1]
	let prev_line_empty = trim(getline(current_line - 1)) == ""
	let next_line_empty = trim(getline(current_line + 1)) == ""
	" remove selected text
	normal gv"xx
	" Generate title string
	let title = join(
		\[
			\prev_line_empty ? "" : "\r",
			\repeat(prefixchar, prefix_repetitions),
			\" ",
			\selection,
			\" ",
			\repeat(postfixchar, postfix_repetitions),
			\next_line_empty ? "" : "\r",
		\],
		\""
	\)
	" inserting text with prefix and postfix
	execute "normal i" . title
endfunction

" Retrieves the contents of a visual selection. Taken from
" https://groups.google.com/g/vim_use/c/ZaPC6p947_M/m/3gB-HdCKmd8J and renamed
function! GetVisualSelection() range
	let reg_save = getreg('"')
	let regtype_save = getregtype('"')
	let cb_save = &clipboard
	set clipboard&
	normal! ""gvy
	let selection = getreg('"')
	call setreg('"', reg_save, regtype_save)
	let &clipboard = cb_save
	return selection
endfunction

" -----------------------------------------------------------------------------
" Surround commands
"
" These utilize the function Surround defined above.

command! -range Arcs :call Surround("(", ")")
command! -range Squares :call Surround("[", "]")
command! -range Angles :call Surround("⟨", "⟩")
command! -range Waves :call Surround("{", "}")
command! -range Set :call Surround("{", "}")
command! -nargs=* -range Title :call TitleFunction(<f-args>)

" Emojis
"
command! Shrug :normal a¯\_(ツ)_/¯<ESC>
