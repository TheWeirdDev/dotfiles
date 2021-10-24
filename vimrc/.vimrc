set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on     " required
set number relativenumber     " relative line numbers
"set number                   " normal line numbers 
set nofoldenable
set cursorline
set noerrorbells
set incsearch  " search as you type
"set scrolloff=9999 " keep cursor in the middle of the screen
"set shell=/usr/bin/fish

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
"Plugin 'vim-scripts/RltvNmbr.vim'
Plugin 'bronson/vim-visual-star-search'
Plugin 'kassio/neoterm'
Plugin 'wincent/terminus'
Plugin 'mattn/emmet-vim'
Plugin 'idanarye/vim-dutyl'
Bundle 'matze/vim-move'
call vundle#end()            " required
let g:dutyl_stdImportPaths=['/usr/include/dlang/dmd']
let g:dutyl_dontUseVimProc=1

let g:move_key_modifier = 'S'
let g:move_map_keys = 0

" Move selected lines using Shift+Up/Down
vmap <S-Up> <Plug>MoveBlockUp
imap <S-Up> <Plug>MoveBlockUp
vmap <S-Down> <Plug>MoveBlockDown
imap <S-Down> <Plug>MoveBlockDown

"nnoremap <S-Up> :m-2<CR>
"nnoremap <S-Down> :m+<CR>
"inoremap <S-Up> <Esc>:m-2<CR>
"inoremap <S-Down> <Esc>:m+<CR>


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
"inoremap        (  ()<Left>
"inoremap        [  []<Left>
"inoremap        {  {}<Left>
"inoremap        <  <lt>><Left>

" Ctrl-z as undo (in insert mode)
inoremap        <c-z> <c-o>:u<CR>

" Ctrl-y to duplicate line
nmap        <c-y> yyp
imap        <c-y> <ESC>yypi
vmap        <c-y> y'>p

nmap        <c-x> :bd<CR>
" Language specific comments

let b:comment_leader = '# '
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '

" set Ctrl+/ as code comment shortcut
" for *nix
nmap <C-_> <leader>c<space>
vmap <C-_> <leader>c<space>
imap <C-_> <esc><leader>c<space>i
" for windows
"nmap <C-/> <leader>c<space>

set showmatch " Show matching brackets
set hlsearch " Highlight in search
set ignorecase " Ignore case in search
set noswapfile " Avoid swap files

set path+=**
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

let g:indentLine_char = '│' "'┆' 
let g:user_emmet_leader_key='<c-f>'

if exists("b:current_syntax")
  finish
endif

" Custom conceal
syntax match todoCheckbox "\[\ \]" conceal cchar=
syntax match todoCheckbox "\[x\]" conceal cchar=

let b:current_syntax = "todo"

hi def link todoCheckbox Todo
hi Conceal guibg=NONE

setlocal cole=1
set visualbell
let g:vim_json_conceal=0

vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>
set clipboard=unnamed
"set t_vb=
set belloff=all

let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

let g:rainbow_active = 1
let g:rainbow_conf = { 
\'guifgs': ['yellow', 'seagreen3', 'lightmagenta', 'cyan','darkorange3','firebrick', 'royalblue3'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'guis': [''],
\	'cterms': [''],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\ }
