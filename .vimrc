syntax on
"  call plug#begin('~/vim/plugged')

" Plug 'flazz/vim-colorschemes'
"    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Plug 'junegunn/fzf'
" Plug 'damage220/vim-finder'
"  Plug 'vim-scripts/Python-Syntax-folding'
"  call plug#end()
:map <C-t> : NERDTreeToggle

" auto reload of .vimrc
autocmd! bufwritepost .vimrc source %
 
" better copy and paste
set pastetoggle=<f4>
set clipboard=unnamed

let python_highlight_all=1
syntax on

set path+=**
set wildmenu

" prepare for netrw
set nocp               " 'compatible' is not set
filetype plugin on     " plugins enabled

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

" just in case to prevent netwr plugin  uncomment the following two lines
"
" :let g:loaded+netrw       = 1
" :let g:loaded_netrwPlugin = 1
"
nnoremap ,html :-1read $HOME/.vim/skels/basic.html<CR>3jwf>a

" auto start netrw upon entry
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

" here below is my old .vimrc as of Fri 22 Feb 2019 01:05:07 AM CST
"
"set nocompatible              " required
"filetype off                  " required

"All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
set autoindent
set backup       " take a backup before changes
set bs=2  
set clipboard=unnamed
"set expandtab    " insert spaces to create a tab
set history=500  " length of history buffer
set hlsearch      " highlignt the search string
set incsearch    " show search as it happens
set laststatus=2            "rch tryit "Thu 25 Dec 2014 05:41:00 PM CST
" set list
" set listchars=tab:>-,trail:.,extends:#,nbsp:.
" set list
set mouse=a
set number
set ruler        " show where I am
set showcmd      " show commands
set showmatch
set shiftwidth=4 
"set tabstop=4    " indenting set
:set statusline=%f\ %m\ [ASCII=%b]\[Hex=%B]\ line:\ %l,%v%8L\[%P]\ Buf:\%n
:set fcs=stl:^,vert:\|           " hi light active window
:set linebreak
:set showbreak='..>'

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
"   set paste then   paste from outside  try Shift-Ctrl-v  (Copy was Crtl-C

:map <F2> a<C-R>=strftime("%c")<CR><ESC> 

":map <C-l> :set cursorline!
:map <C-d> : set cul!  " d for da-line cannot use l it is for window shifts
":highlight cursorline ctermbg=lightgray
:highlight cursorline ctermbg=blue    
:map <C-c> :set cursorcolumn! " use  C-d for column because c-l not avail
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
"nnoremap <C-H> <C-W><C-H>
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
nnoremap <f5> <C-W><C-H>
nnoremap <f6> <C-W><C-J>
nnoremap <f7> <C-W><C-K>
nnoremap <f8> <C-W><C-L>
nnoremap <c-w> <c-w>x   " swap two windows

" Enable folding
set foldmethod=indent
set foldlevel=99
" enable folding by space bar
nnoremap <space> za

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"nnoremap <leader>v"+gP
nnoremap <leader>v i<C-r>+

vnoremap <C-c> "+y

" set so search ignore case
set hlsearch
set incsearch
set ignorecase
set smartcase
map <c-n> :set nu!
map <c-r> :set rnu!

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
