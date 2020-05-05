"----------------------------------------------------------------------------
"
"    Vim 8.x configuration
"
"----------------------------------------------------------------------------

"-- Plugin manager
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

"-- Search and replace in files:
"   :Ack text
"   :cfdo %s/text/newtext/g
"   :cfdo update
"
call plug#begin()
"-- Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" -- Remote plugin framework used by ncm2 and
Plug 'roxma/nvim-yarp'
"--  Completion
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-jedi'
"-- Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"-- Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
"-- Ack (grep)
Plug 'mileszs/ack.vim'
"-- Find and replace
Plug 'brooth/far.vim'
"-- Comments
Plug 'scrooloose/nerdcommenter'
"-- Automatic closing ()
Plug 'Raimondi/delimitMate'
"-- Asynchronous Lint Engine
Plug 'dense-analysis/ale'
"-- Fuzzy search
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
"-- Themes
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'git@gitlab.com:yorickpeterse/happy_hacking.vim.git'
"-- Dracula theme
Plug 'dracula/vim', { 'name': 'dracula' }
"-- EditorConfig
Plug 'editorconfig/editorconfig-vim'
"-- Clojure
Plug 'tpope/vim-fireplace'
Plug 'venantius/vim-cljfmt'
"-- Easy motion
Plug 'easymotion/vim-easymotion'
"-- Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"-- Tagbar
Plug 'majutsushi/tagbar'
call plug#end()

colo base16-ocean

set nocompatible

set bs=2

set termguicolors
set background=dark

filetype on
filetype plugin on
syntax on
set omnifunc=syntaxcomplete#Complete

" Omni-completion
inoremap <C-Space> <C-x><C-o>

set nu
set encoding=utf-8
set noswapfile
set hidden
set clipboard=unnamed
set ignorecase
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent

" Show existing tab with 4 spaces width
set tabstop=4
" 4 spaces will be inserted when tab is pressed
set softtabstop=4
" When indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert spaces
set expandtab
" Copy indent from current line when starting a new line
set autoindent
" Automatically determine the next indentation level based on the file type
filetype plugin indent on

" Mouse allowed
set mouse=a

set colorcolumn=80
"hi ColorColumn ctermbg=0 guibg=lightgrey

set splitright
set splitbelow

" Changing cursor by mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

set hlsearch
" Use <C-l> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Leader key
let mapleader = ","

" fuzzy search => use `:find <file>`
set path+=**
set wildmenu
"nnoremap <c-p> :find

" Useful shortcuts
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

" Lua
au BufNewFile,BufRead *.lua set tabstop=2 softtabstop=2 shiftwidth=2 expandtab autoindent

" YAML
au BufNewFile,BufRead *.yaml set tabstop=2 softtabstop=2 shiftwidth=2 expandtab autoindent
au BufNewFile,BufRead *.yml set tabstop=2 softtabstop=2 shiftwidth=2 expandtab autoindent

" Jenkinsfile
autocmd BufNewFile,BufRead Jenkinsfile* set ft=groovy

" Dockerfiles
autocmd BufNewFile,BufRead Dockerfile* set ft=dockerfile

" Remove trailing whitespaces on save for some types of files
autocmd BufWritePre Dockerfile* %s/\s\+$//e
autocmd BufWritePre Jenkinsfile* %s/\s\+$//e
autocmd BufWritePre *.py %s/\s\+$//e
autocmd BufWritePre *.groovy %s/\s\+$//e

" Smart window navigation
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
"nmap <C-l> <C-w>l
nmap <C-h> <C-w>h

" Explorer
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3
let g:netrw_winsize = 25

" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>

function! PotionCompileAndRunFile()
    ":echo expand('%:p')
    echo expand('%:p')
    "silent !clear
    "execute \"!ls -l\"
endfunction

" Quick buffer selection
function! BufSel(pattern)
  let bufcount = bufnr("$")
  let currbufnr = 1
  let nummatches = 0
  let firstmatchingbufnr = 0
  while currbufnr <= bufcount
    if(bufexists(currbufnr))
      let currbufname = bufname(currbufnr)
      if(match(currbufname, a:pattern) > -1)
        echo currbufnr . ": ". bufname(currbufnr)
        let nummatches += 1
        let firstmatchingbufnr = currbufnr
      endif
    endif
    let currbufnr = currbufnr + 1
  endwhile
  if(nummatches == 1)
    execute ":buffer ". firstmatchingbufnr
  elseif(nummatches > 1)
    let desiredbufnr = input("Enter buffer number: ")
    if(strlen(desiredbufnr) != 0)
      execute ":buffer ". desiredbufnr
    endif
  else
    echo "No matching buffers"
  endif
endfunction

"Bind the BufSel() function to a user-command
command! -nargs=1 Bs :call BufSel("<args>")

" ale
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:ale_linters = {'perl': ['perl','perlcritic'] }
let g:ale_perl_perlcritic_showrules = 1

" airline
let g:airline_theme='light'
let g:airline_powerline_fonts = 2

" Clojure
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces

" NerdCommenter: Toggle comment by Ctrl+\
map <silent> \ :call NERDComment('n', 'Toggle')<CR>
map <silent> <C-\> :call NERDComment('n', 'Toggle')<CR>
imap <silent> <C-\> <C-O>:call NERDComment('n', 'Toggle')<CR>

" fzf
" enter:    current window
" ctrl-t:   new tab
" ctrl-x:   horizontal split
" ctrl-v:   vertical split
map <C-p> :FZF<CR>
map <C-b> :Buffers<CR>
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Tagbar for Go
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }
let g:tagbar_left = 1
