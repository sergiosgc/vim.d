set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/vundle
call vundle#rc('~/.vundle')

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-sensible'
Bundle 'bling/vim-airline'
Bundle 'altercation/vim-colors-solarized'
"Bundle 'wombat256.vim'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
"Bundle 'garbas/vim-snipmate'
Bundle 'hail2u/vim-css3-syntax'
"Bundle 'Valloric/YouCompleteMe'
" Jedi VIM does not play well with YouCompleteMe. Disabled
"Bundle davidhalter/jedi-vim
Bundle 'othree/html5.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'rgarver/Kwbd.vim'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'
Bundle 'avakhov/vim-yaml'
Bundle 'chase/vim-ansible-yaml'

let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

set t_Co=256

try
    colorscheme wombat256
    syntax on
catch /.*/
    unlet colors_name
    colorscheme torte
    syntax on
endtry
" Always show tabline
set showtabline=2
" Use indentation from current line when starting a new line
set autoindent
" Allow backspacing over everything in insert mode
set backspace=indent,eol,start
" Move cursor to matched string, while typing search string
set incsearch
" Disable search highlighting
set nohlsearch
" Set dark background
set background=dark
" Set the terminal title
set title
" Set alternate caption of VIM window: <filename> (<path>)
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)
" Show cursor position all the time
set ruler
" Display incomplete commands
set showcmd
" Expand tabs to spaces
set expandtab
" Tabs are four spaces
set tabstop=4
set shiftwidth=4
" Fold by markers
set foldmethod=marker
set fillchars=" "
" viminfo 'remember' settings
set viminfo='10,\"100,:20,%,n~/.viminfo
" Save swap files on /tmp
set directory=/tmp
" Allow switching buffers without saving
set hidden

" Restore cursor position on open
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
        \ endif

" Ex-mode is useless remap to execute macros
nmap Q @@

" Ctrl-c saves everything and exits
nmap <silent> <C-c> :xa<CR>
" Ctrl-x closes buffer, keeps window
nmap <silent> <C-x> :Kwbd<CR>
" F3 Toggles NERDTree
nmap <silent> <F3> :NERDTreeToggle<CR>
nmap <silent> <F4> :NERDTreeFind<CR>
" Ctrl Left Right Up Down maps to window movement
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
"nmap <silent> <C-Left> :wincmd h<CR>
"nmap <silent> <C-Right> :wincmd l<CR>
nmap <silent> <C-Left> :bN<CR>
nmap <silent> <C-Right> :bn<CR>
" Alt Left and Alt Right maps to tab movement
nmap <silent> <A-Left> :bN<CR>
nmap <silent> <A-Right> :bn<CR>
nnoremap m :w\|!make -C $(for i in ./Makefile ../Makefile ../../Makefile ../../../Makefile ../../../../Makefile; do if [ -f $i ]; then echo $(dirname $i); exit; fi; done)<CR>

filetype plugin indent on 

" Open NERDTree when starting vim with no open files
autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if NERDTree is the last open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Change cwd to the buffer directory on buffer open , so that NERDTree opens up the local directory 
autocmd bufEnter * execute ":silent! lcd " . expand("%:p:h")

" Open bookmarks in NERDTree
let NERDTreeShowBookmarks=1
" Enable and configure completion on file open
set wildmode=longest,list,full
set wildmenu

"let g:airline_solarized_reduced = 0
"let g:airline_powerline_fonts = 1
"let g:airline_theme = 'solarized'
"let g:airline#extensions#whitespace#symbol = '☼'
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#tab_nr_type = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '│'
"let g:airline#extensions#tabline#right_sep = ''
"let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'

if argc() > 1
 " Avoid E173 - load the last buffer then switch back to the first
 silent blast
 silent bfirst
endif

" Allow for make to reside in the parent directory
let &makeprg = 'if [ -f Makefile ]; then make; else make -C ..; fi'

" vim-session configuration
let g:session_autosave = 'yes'
let g:session_default_to_last = 1
let g:session_autoload = 'yes'
