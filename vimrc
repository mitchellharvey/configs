" Enable line numbers
set number

" Leader key
:let mapleader = ","

" Enable backspace
set backspace=indent,eol,start

" Sets how many lines of history VIM has to remember
set history=700

" Cycle to next buffer
noremap <leader>, :bn<cr>

" Close buffer
noremap <leader>c :bp<bar>sp<bar>bn<bar>bd<cr>

" Enable filetype plugins
filetype plugin on
filetype indent on

" Navigate pane splits
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

" For splits to open right and bottom oriented
set splitbelow
set splitright

" Set to auto read when a file is changed from the outside
set autoread

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Enable hidden so unsaved files are hidden and not closed
set hidden

" Highlight search results
set hlsearch

" Enable increimental search
set incsearch

" Don't redraw while executing macros
set lazyredraw

" Enable 'magic' for regex
set magic

" Show matching brackets when text indidcatior is over them
set showmatch

" How often to blink matching brackets
set mat=2

" Enable syntax highlighting 
syntax enable

" Set coloscheme
colorscheme molokai

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,mac,dos

" Disable backup
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Smart tabs!
set smarttab

" 1 tab = 4 spaces
set shiftwidth=4
set tabstop=4

" Auto and smart indet, wrap lines
set ai
set si
set wrap

" Return to last edit position when opening files
autocmd BufReadPost *
    \ if line("'\'") > 0 && line("'\'") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Reload vimrc
map <leader>r :source ~/.vimrc<cr>

" Open .vimrc for editing
map <leader>e :tabe ~/.vimrc<cr>

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Add filler lines for diffing files
set diffopt=filler

" Ignore white space while diffing files
set diffopt+=iwhite

" Associate certain filetypes w/ certain languages
au BufRead,BufNewFile *.rml set filetype=lua
au BufRead,BufNewFile *.tpl set filetype=html
au BufRead,BufNewFile *.mm set filetype=cpp

" Begin Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" My Bundles
Plugin 'scrooloose/nerdtree' 

" End Vundle
call vundle#end()
filetype plugin indent on

" NERDTREE Config  /////////////////////////////////////////

" Toggle nerd tree on/off
map <leader>d :NERDTreeToggle<cr>

" Autostart nerdtree on vim launch
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd vimenter * wincmd p

" Close vim if only NERDTree window is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

