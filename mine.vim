" Vim color file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2006 Apr 14

" This color scheme uses a dark grey background.

" First remove all existing highlighting.
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

" don't forget to set the name below correctly
let colors_name = "mine"

"i Normal ctermbg=DarkGrey ctermfg=White guifg=White guibg=grey20

" Groups used in the 'highlight' and 'guicursor' options default value.
hi ErrorMsg term=standout ctermbg=DarkRed ctermfg=White guibg=Red guifg=White
hi IncSearch term=reverse cterm=reverse gui=reverse
hi ModeMsg term=bold cterm=bold gui=bold
hi StatusLine term=reverse,bold cterm=reverse,bold gui=reverse,bold
hi StatusLineNC term=reverse cterm=reverse gui=reverse
hi VertSplit term=reverse cterm=reverse gui=reverse
hi Visual term=reverse ctermbg=black guibg=grey60
hi VisualNOS term=underline,bold cterm=underline,bold gui=underline,bold
hi DiffText term=reverse cterm=bold ctermbg=Red gui=bold guibg=Red
hi Cursor guibg=Green guifg=Black
hi lCursor guibg=Cyan guifg=Black
hi Directory term=bold ctermfg=LightCyan guifg=Cyan
hi LineNr term=underline ctermfg=Yellow guifg=Yellow
hi MoreMsg term=bold ctermfg=LightGreen gui=bold guifg=SeaGreen
hi NonText term=bold ctermfg=LightBlue gui=bold guifg=LightBlue guibg=grey30
hi Question term=standout ctermfg=LightGreen gui=bold guifg=Green
hi Search term=reverse ctermbg=Yellow ctermfg=Black guibg=Yellow guifg=Black
hi SpecialKey term=bold ctermfg=LightBlue guifg=Cyan
hi Title term=bold ctermfg=LightMagenta gui=bold guifg=Magenta
hi WarningMsg term=standout ctermfg=LightRed guifg=Red
hi WildMenu term=standout ctermbg=Yellow ctermfg=Black guibg=Yellow guifg=Black
hi Folded term=standout ctermbg=LightGrey ctermfg=DarkBlue guibg=LightGrey guifg=DarkBlue
hi FoldColumn term=standout ctermbg=LightGrey ctermfg=DarkBlue guibg=Grey guifg=DarkBlue
hi DiffAdd term=bold ctermbg=DarkBlue guibg=DarkBlue
hi DiffChange term=bold ctermbg=DarkMagenta guibg=DarkMagenta
hi DiffDelete term=bold ctermfg=Blue ctermbg=DarkCyan gui=bold guifg=Blue guibg=DarkCyan
hi CursorColumn term=reverse ctermbg=Black guibg=grey40
hi CursorLine term=underline cterm=underline guibg=grey40

" Groups for syntax highlighting
hi Constant term=underline ctermfg=Magenta guifg=#ffa0a0 guibg=grey5
hi Special term=bold ctermfg=LightRed guifg=Orange guibg=grey5
if &t_Co > 8
  hi Statement term=bold cterm=bold ctermfg=Yellow guifg=#ffff60 gui=bold
endif
hi Ignore ctermfg=DarkGrey guifg=grey20

" added by rch
" Notes 1. everything above this block is copied from  evening.vim
"       2. the name mine.vim is not unique
"       3. base info starts in usr/share/vim/vim74
"       4.   in particular   --/colors/evening.vim
"       5.                   --/syntax.python.vim
"       6. show color example  :h group-name
"       7.            by name number  :h cterm-colors
"       8. remember  :runtime syntax/colortest.vim
"       9. h highlight-groups     show default names
"      10. change temp by  :hi  args   cmd

hi Normal ctermbg=Black    ctermfg=White guifg=White guibg=grey20
hi StatusLineNC term=reverse ctermbg=gray    gui=reverse
hi NonText term=bold ctermfg=Lightred gui=bold guifg=LightBlue guibg=grey30

hi Comment ctermfg=white ctermbg=brown  " for comments
hi exception ctermfg=black ctermbg=green  " for try, raise, except, finally
hi search ctermfg=darkred ctermbg=white
hi pythonInclude ctermbg=gray ctermfg=yellow
hi Preproc cterm=bold ctermfg=7
" see http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
"  hi x059_Grey37 ctermfg=59 guifg=#5f5f5f "rgb=95,95,95
hi Constant cterm=bold ctermfg=Yellow ctermbg=59
hi Operator ctermbg=brown ctermfg=white  
hi Conditional  ctermbg=black ctermfg=red
hi Keyword      ctermbg=black ctermfg=green
" chg for readability from bg=gray fg=blue Tue 05 Feb 2019 09:59:29 AM CST
hi Function ctermbg=white  ctermfg=blue 
hi Visual term=reverse ctermbg=blue  guibg=grey60 " to show up
hi Visual ctermbg=blue  guibg=white  " to show up
" vim: sw=2


