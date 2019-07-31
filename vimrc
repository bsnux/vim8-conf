"----------------------------------------------------------------------------
"
"    Vim 8.x configuration with minimum plugins
"    
"----------------------------------------------------------------------------

set nocompatible

set bs=2

set termguicolors
"colo ayu
colo one
"colo onedark
"colo gruvbox
set background=dark

filetype on
filetype plugin on
syntax on
set omnifunc=syntaxcomplete#Complete

set nu
set encoding=utf-8
set noswapfile
set hidden
"set clipboard=unnamed
set ignorecase
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent
"set mouse=a

set colorcolumn=80
"hi ColorColumn ctermbg=0 guibg=lightgrey

" Changing cursor by mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

set hlsearch
" Use <C-l> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" fuzzy search => use `:find <file>`
set path+=**
set wildmenu
nnoremap <c-p> :find 

" Open a new tab
ca tn tabnew

" Ctrl-g is ESC
inoremap <c-g> <Esc>
cnoremap <c-g> <Esc>
vnoremap <c-g> <Esc>
imap <c-g> <Esc>

" Emacs keys for command line
cnoremap <C-A>	<Home>
cnoremap <C-B>	<Left>
cnoremap <C-D>	<Del>
cnoremap <C-E>	<End>
cnoremap <C-F>	<Right>

" Emacs keybiding for insert mode
imap <C-e> <esc>$a
imap <C-a> <esc>0i
imap <C-f> <esc>lli
imap <C-b> <esc>i
imap <C-k> <esc>d$i

" Python
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent

" Jenkinsfile
autocmd BufNewFile,BufRead Jenkinsfile set ft=groovy

"------ Plugins
" ale
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

" airline
let g:airline_theme='light'
let g:airline_powerline_fonts = 1
