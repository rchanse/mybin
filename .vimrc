" changes
" Mon 10 Feb 2020 09:35:33 AM CST
" remove  plug comment  flazz junegunn/fzf 
" Sun 17 Mar 2019 12:28:42 PM CDT 
"  comment out plugin manager  and  NERDtree  "(1)
  
syntax on

" auto reload of .vimrc
autocmd! bufwritepost .vimrc source %
 
let python_highlight_all=1

" prepare for netrw
set nocp                    " 'compatible' is not set
filetype plugin on          " plugins enabled

let g:netrw_banner=0        " kill the top banner
let g:netrw_browse_split=3  " 1,vertsp  2,hor sp  3,new tab  4,prev
let g:netrw_winsize=20
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
" dr chip setting
let g:netrw_altv           =1
let g:netrw_fastbrowse     =1  " med speed dir browsing
let g:netrw_keepdir        =0  " keep cur dir same as brow dir
" let g:netrw_liststyle      =2  " 0-thin, 1-long, 2-wide, 3-tree 
let g:netrw_retmap         =1  " see doc
"let g:netrw_silent         =1  " transfer done  0-normal, 1-silent
let g:netrw_special_syntax =1  " see doc
" let g:netrw_hide=0             " show all files

" just in case to prevent netwr plugin  uncomment the following two lines
"
" :let g:loaded+netrw       = 1
" :let g:loaded_netrwPlugin = 1

"All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
"
"set nocompatible              " required
"filetype off                  " required
set autoindent         "ai  autoindent
set backup             "bk  take a backup before changes
set bs=2  
"set clipboard=unnamed
"set expandtab    " insert spaces to create a tab
set history=500  " length of history buffer
set laststatus=2            "rch tryit "Thu 25 Dec 2014 05:41:00 PM CST
" set list
" set listchars=tab:>-,trail:.,extends:#,nbsp:.
set mouse=a
set number
set ruler        " show where I am
set shiftwidth=4 
set showcmd      " show commands
set showmatch
"set tabstop=4    " indenting set
:set statusline=%f\ %m\ [ASCII=%b]\[Hex=%B]\ line:\ %l,%v%8L\[%P]\ Buf:\%n
:set fcs=stl:^,vert:\|           " hi light active window
:set linebreak
"
" set so search ignore case
set hlsearch           " hls  nohls  uhighlignt the search string
set incsearch          " is  show search as it happens
set ignorecase         " ic
set smartcase          " scs
map <c-n> :set nu!
map <c-r> :set rnu!
set showbreak='..>'    " sbr
" suggestion for python
set textwidth=79  " tw  lines longer thatn 79 will be broken
set colorcolumn=-3
set shiftwidth=4  " sw  operation >> indents 4 col << unindents 4 col
set tabstop=4     " ts  hard TAB displays 4 col
set expandtab     " et  inserts spaces when hitting TABs
set softtabstop=4 " sts insert/delete 4 space when TAB/BACKSPACE
set shiftround    " sr  round indent to mlt of 'shiftwidth'
set autoindent    " ai  align the new line indent with prev line


colorscheme mine        " set the colors to ~/.vim/colors/mine.vim


" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif



"  zt zz zb  move window keep cursor on same line  to  top-middle-bottom
"  H M L     move cursor keep window still  Head Middle Last
"  gg  G  move top/bottom in file
"
inoremap jk <Esc>
inoremap kj  <Esc>
:map <f12> :q!<CR>
"   set paste then   paste from outside  try Shift-Ctrl-v  (Copy was Crtl-C

:map <F2> a<C-R>=strftime("%c")<CR><ESC> 
":map <C-l> :set cursorline!
:map <C-c> :set cursorcolumn! " use  C-d for column because c-l not avail
:map <C-d> : set cul!  " d for da-line cannot use l it is for window shifts
":highlight cursorline ctermbg=lightgray
:highlight cursorline ctermbg=blue    
:highlight cursorline ctermbg=red   ctermfg=black
:highlight cursorcolumn ctermbg=blue  " lightgray

:let mapleader = ","
:map <leader>ev :vsplit $MYVIMRC<cr>
:map <leader>sv :source $MYVIMRC<cr>

" easier between tabs
map <Leader>n <esc>:tabprev<cr>
map <Leader>m <esc>:tabnext<cr>

" for python
" map sort fnt to a key
vnoremap <Leader>s : sort<cr>

" easier way to move code blocks
vnoremap < <gv  " better indent
vnoremap > >gv  " better indent

" expand tabs into spaces
" set expandtab
" enable all python syntax highlighting features
"let python_highlight_all = 1

"https://realpython.com/vim-and-python-a-match-made-in-heaven/ 

"split navigation
nnoremap <C-H> <C-W><C-H>   " left
nnoremap <C-J> <C-W><C-J>   " down
nnoremap <C-K> <C-W><C-K>   " up
nnoremap <C-L> <C-W><C-L>   " right
nnoremap <f5> <C-W><C-H>    " left
nnoremap <f6> <C-W><C-J>    " down
nnoremap <f7> <C-W><C-K>    " up
nnoremap <f8> <C-W><C-L>    " right
"nnoremap <c-x> <c-w>x   " swap two windows

" Enable folding
set foldmethod=manual
set foldlevel=99
" enable folding by space bar
" rch change nnoremap <space> za

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"nnoremap <leader>v"+gP
nnoremap <leader>v i<C-r>+

vnoremap <C-c> "+y


"   tab testing  vim and tabs  youtube.com
"
" reverse n and t, cannot use tn - next
nnoremap nt  :tabnew<Space> 

nnoremap tn  :tabnext<cr>    "next
nnoremap tp  :tabprev<cr>    "previous
nnoremap tf  :tabfirst<cr>   "first
nnoremap tl  :tablast<cr>    "last
nnoremap tr  :tabnext<cr>    " move right to next file
nnoremap tl  :tabprev<cr>    " move left to previous file
nnoremap t0  :tabfirst<cr>   " leftmost (start at 0 )
nnoremap tm  :tablast<cr>    " rightmost (max to right)

fun!  Fit(acro)
    let s:found = "no"
    for line in readfile('/home/rchansen/.vim/FF_acrolist')
	if  s:found == "no"  
	    let words = split(line)
            if  words[0] == a:acro
		let s:found = "yes"
                execute "tabnew "words[1]
		return
            endif
	endif
    endfor
    echo "Acronym "a:acro" is NOT in the list -- edit with acro"
endfunction
" type aid to invoke Fit function
map FF :call Fit("")<left><left>


nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>
