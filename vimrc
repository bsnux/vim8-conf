"----------------------------------------------------------------------------
"
"    Vim 8.x configuration with minimum plugins
"    
"----------------------------------------------------------------------------

"-- Search and replace in files:
"   :Ack text
"   :cfdo %s/text/newtext/g
"   :cfdo update
"
"-- Select text 

"Optional packages
" `onedark.vim` must be here, otherwise it won't work
packadd! onedark.vim
packadd! vim-fireplace
packadd! vim-salve
packadd! rainbow_parentheses.vim
packadd! vim-cljfmt

colorscheme onedark

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

" Leader key
let mapleader = ","

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

" Dockerfiles
autocmd BufNewFile,BufRead Dockerfile* set ft=dockerfile


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

function! CurrentLineInfo()
lua << EOF
local linenr = vim.window().line
local curline = vim.buffer()[linenr]
print(string.format("Current line [%d] has %d chars", linenr, #curline))
EOF
endfunction

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
