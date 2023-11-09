""" A 16-bit Vim color file
"
" To actually make this look good and not burn your eyes, please adjust the
" colors 0–15 in your terminal emulator itself, especially the color 0 (black)
" to a shade of dark gray. In addition, set the background color with
"
"     set background=(light|dark)
"
" in your vimrc file. The idea is to make the colors look consistent between
" different environments by restricting the number of colors.
"
" Maintainer:   Santtu Söderholm <santtu.soderholm@protonmail.com>
" Last Change: 2022-05-28
"
" Related help screens:
"
" :h group-name
" :h highlight-groups
" :h cterm-colors

" ColorFn colors cterm colors and sets text shape.

function! ColorFn(group, bg, fg, shape)

	let highlightstr = 'highlight ' . a:group . ' '
	let highlightstr .= 'ctermbg=' . a:bg . ' '
	let highlightstr .= 'ctermfg=' . a:fg . ' '
	let highlightstr .= 'cterm=' . a:shape . ' '
	let highlightstr .= 'term=' . a:shape . ' '

	execute highlightstr

endfunction

" Map color names to numbers (normal and bright variants)

let black    = 0
let red      = 1
let green    = 2
let yellow   = 3
let blue     = 4
let purple   = 5
let cyan     = 6
let white    = 7
let brblack  = 8
let brred    = 9
let brgreen  = 10
let bryellow = 11
let brblue   = 12
let brpurple = 13
let brcyan   = 14
let brwhite  = 15

" A null variable and other text shapes

let none = "none"
let bold = "bold"
let underline = "underline"
let reverse = "reverse"
let term = "term"
let bg = "bg"
let fg = "fg"

"" Choose background color outside of the file.

let dark = "dark"
let light = "light"

"" Clear all highlighting

highlight clear

if exists("syntax_on")
	syntax reset
endif

" Name of this color scheme

let g:colors_name="santun_värit"

"" Color selection
"
" Choose colors based on background color flag and the number of colors
" available to the terminal.

if &background == dark && &t_Co >= 16

	call ColorFn("Normal", black, white, none)
	call ColorFn("LineNr", black, brgreen, none)
	call ColorFn("MatchParen", white, brblack, none)

	"" User interface color settings.

	call ColorFn("Cursor", white, black, none)
	call ColorFn("CursorIM", white, black, none)
	call ColorFn("Directory", none, brgreen, none)
	call ColorFn("DiffAdd", none, brgreen, none)
	call ColorFn("DiffChange", none, bryellow, none)
	call ColorFn("DiffDelete", none, brred, none)
	call ColorFn("diffRemoved", none, brred, none)
	call ColorFn("diffChanged", none, bryellow, none)
	call ColorFn("diffAdded", none, brgreen, none)
	call ColorFn("ErrorMsg", red, white, none)
	" hi VertSplit
	" hi Folded
	" hi FoldColumn
	call ColorFn("IncSearch", none, black, none)
	" hi ModeMsg
	" hi MoreMsg
	call ColorFn("NonText", none, brblack, none)
	" hi Question
	call ColorFn("Search", bryellow, black, none)
	call ColorFn("SpecialKey", none, brblack, none)
	call ColorFn("StatusLine", brgreen, black, none)
	call ColorFn("StatusLineNC", bryellow, black, none)
	call ColorFn("Title", none, black, bold)
	call ColorFn("Visual", brblack, white, none)
	" hi VisualNOS
	call ColorFn("WarningMsg", bryellow, black, none)
	" hi WildMenu
	" hi Menu
	" hi Scrollbar
	" hi Tooltip

	"" Syntax highlighting groups

	call ColorFn("Comment", none, brcyan, none)
	call ColorFn("Constant", none, brgreen, none)
	call ColorFn("Identifier", none, brred, none)
	call ColorFn("Statement", none, brpurple, none)
	call ColorFn("PreProc", none, brpurple, none)
	call ColorFn("Type", none, brred, none)
	call ColorFn("Special", none, brgreen, none)
	call ColorFn("Underlined", none, brcyan, none)
	call ColorFn("Ignore", none, bryellow, none)
	call ColorFn("Error", red, white, none)
	call ColorFn("Todo", none, bryellow, none)

elseif &background == light && &t_Co >= 16

	call ColorFn("Normal", white, black, none)
	call ColorFn("LineNr", white, black, none)
	call ColorFn("MatchParen", brblack, white, none)

	"" User interface color settings.

	call ColorFn("Cursor", black, white, none)
	call ColorFn("CursorIM", black, white, none)
	call ColorFn("Directory", none, black, bold)
	call ColorFn("DiffAdd", none, green, none)
	call ColorFn("DiffChange", none, yellow, none)
	call ColorFn("DiffDelete", none, red, none)
	call ColorFn("diffRemoved", none, red, none)
	call ColorFn("diffChanged", none, yellow, none)
	call ColorFn("diffAdded", none, green, none)
	call ColorFn("ErrorMsg", red, white, none)
	" hi VertSplit
	" hi Folded
	" hi FoldColumn
	call ColorFn("IncSearch", none, black, none)
	call ColorFn("NonText", white, black, none)
	call ColorFn("Parens", none, black, none)
	call ColorFn("Search", green, black, none)
	call ColorFn("SpecialKey", none, black, none)
	call ColorFn("Search", black, white, none)
	call ColorFn("StatusLine", brblack, white, none)
	call ColorFn("StatusLineNC", yellow, black, none)
	call ColorFn("Title", none, black, none)
	call ColorFn("Visual", black, white, none)
	call ColorFn("WarningMsg", yellow, black, none)
	call ColorFn("WildMenu", bryellow, black, none)
	call ColorFn("Menu", brblack, white, none)
	" hi Scrollbar
	call ColorFn("Tooltip", bryellow, black, none)

	"" Syntax highlighting groups

	call ColorFn("Comment", none, blue, none)
	call ColorFn("Constant", none, black, none)
	call ColorFn("Identifier", none, black, bold)
	call ColorFn("Statement", none, black, bold)
	call ColorFn("PreProc", none, black, bold)
	call ColorFn("Type", none, brblack, bold)
	call ColorFn("Special", none, brblack, none)
	call ColorFn("Underlined", none, cyan, none)
	call ColorFn("Ignore", none, yellow, none)
	call ColorFn("Error", red, white, none)
	call ColorFn("Todo", none, black, bold)

else " TODO: assume only 8 available colors

	" Do nothing

endif

" Link common colors

hi link DiffText Normal
