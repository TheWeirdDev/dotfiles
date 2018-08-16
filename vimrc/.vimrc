set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on     " required
set number relativenumber     " relative line numbers
"set number                   " normal line numbers 
set nofoldenable
set cursorline " highlight current line
set incsearch  " search as you type
"set scrolloff=9999 " keep cursor in the middle of the screen
set shell=/usr/bin/bash

" Vundle setup
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'mikelue/vim-maven-plugin'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'josuegaleas/jay'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'ayu-theme/ayu-vim' 
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'dracula/vim'
"Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'davidhalter/jedi-vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'Yggdroot/indentLine'
call vundle#end()            " required

syntax enable
set termguicolors     " enable true colors support
set background=dark
colorscheme ayu
let ayucolor="dark"   " for dark version of theme
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme

" ### Other color schemes ###
"colorscheme PaperColor
"colorscheme palenight
"colorscheme dracula
"colorscheme jay

" Airline theme
let g:airline_theme='wombat'
let g:airline#extensions#tabline#enabled = 1

"let g:airline_theme='papercolor'
let g:jedi#force_py_version = 3 " force python 3

set laststatus=2
set t_Co=256

set mouse=a

" Bracket completion
inoremap        (  ()<Left>
inoremap        [  []<Left>
inoremap        {  {}<Left>

" Ctrl-z as undo (in insert mode)
inoremap        <c-z> <c-o>:u<CR>

" Ctrl-y to duplicate line
nmap        <c-y> yyp
imap        <c-y> <ESC>yypi

" Language specific comments
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '

" set Ctrl+/ as code comment shortcut
" for *nix
nmap <C-_> <leader>c<space>
" for windows
"nmap <C-/> <leader>c<space>

set showmatch " Show matching brackets
set hlsearch " Highlight in search
set ignorecase " Ignore case in search
set noswapfile " Avoid swap files

set showcmd
set wildmenu
set guioptions=rb
set guicursor+=i:blinkwait10
set nocp
set clipboard=unnamed
set clipboard=unnamedplus
set expandtab

set tabstop=4
set softtabstop=4
set shiftwidth=4

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1

" Shift+Ctrl+Left/Right to switch buffers
noremap <S-C-left> :bprev<CR> 
noremap <S-C-right> :bnext<CR>

" Shift+Up/Down to move lines
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

" Ctrl+Up/Down/Left/Righ to switch between split windows
map <C-Down> <C-W>j
map <C-Up> <C-W>k
map <C-Left> <C-W>h
map <C-Right> <C-W>l

" autorun NerdTree
"autocmd vimenter * NERDTree

" F1 to run current file
nmap <F1> :!./%<CR>

" F2 to open NerdTree
nmap <F2> :NERDTreeToggle<CR>

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1

nmap <F3> :TagbarToggle<CR>

" F10 for paste mode
set pastetoggle=<F10>

" Enable GitGutter on startup
autocmd vimenter * GitGutterEnable
autocmd vimenter *  set colorcolumn=0

" Close documentation when popup closed
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" restore previous state
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" Automatically go to next/prev line
set whichwrap+=<,>,h,l,[,]
let g:indentLine_char = '┆'


