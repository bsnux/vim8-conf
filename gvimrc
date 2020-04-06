"----------------------------------------------------------------------------
"
"    MacVim 8.x configuration
"
"----------------------------------------------------------------------------

"set guifont=Fira\ Code:h16
set guifont=Hack:h13
" These lines should be here and not in .vimrc
macmenu File.Print key=<nop>
nnoremap <D-p> :ls<CR>:b<Space>
nnoremap <D-right> :bn<CR>
nnoremap <D-left> :bp<CR>
macmenu File.Close key=<nop>
nnoremap <D-w> :bd<CR>
macmenu File.Save key=<nop>
inoremap <D-s> <ESC>:w<CR>
nnoremap <D-s> :w<CR>
inoremap <D-enter> <ESC>o

set lines=76
set columns=120

set autoread

let macvim_hig_shift_movement = 1

if exists("macvim_hig_shift_movement")
  " Shift + special movement key (<S-Left>, etc.) and mouse starts insert mode
  set selectmode=mouse,key
  set keymodel=startsel,stopsel

  " HIG related shift + special movement key mappings
  nn   <S-D-Left>     <S-Home>
  vn   <S-D-Left>     <S-Home>
  ino  <S-D-Left>     <S-Home>
  nn   <S-M-Left>     <S-C-Left>
  vn   <S-M-Left>     <S-C-Left>
  ino  <S-M-Left>     <S-C-Left>

  nn   <S-D-Right>    <S-End>
  vn   <S-D-Right>    <S-End>
  ino  <S-D-Right>    <S-End>
  nn   <S-M-Right>    <S-C-Right>
  vn   <S-M-Right>    <S-C-Right>
  ino  <S-M-Right>    <S-C-Right>

  nn   <S-D-Up>       <S-C-Home>
  vn   <S-D-Up>       <S-C-Home>
  ino  <S-D-Up>       <S-C-Home>

  nn   <S-D-Down>     <S-C-End>
  vn   <S-D-Down>     <S-C-End>
  ino  <S-D-Down>     <S-C-End>
endif " exists("macvim_hig_shift_movement")

amenu icon=/Applications/MacVim.app/Contents/Resources/Save.png TouchBar.save :w<CR>

" Tab navigation
nnoremap <M-D-Right>   :tabnext<CR>
nnoremap <M-D-Left>   :tabprev<CR>
set guitablabel=⌘%N\ %f
noremap <D-1> :tabn 1<CR>
noremap <D-2> :tabn 2<CR>
noremap <D-3> :tabn 3<CR>
noremap <D-4> :tabn 4<CR>
noremap <D-5> :tabn 5<CR>
noremap <D-6> :tabn 6<CR>

set clipboard=unnamed

" Sublime Text background color for base16-ocean
hi Normal guibg=#2b303b

" VerticalSplit style
hi VertSplit guibg=#ffffff
