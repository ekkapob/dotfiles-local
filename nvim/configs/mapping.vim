" Leader
let mapleader = " "

" Faster saving""
noremap <Leader>w :up<CR>

" Faster quit
noremap <Leader>q :up<CR>:q<CR>


" Enter Explore faster
map <Leader>e :Explore<CR>

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
" Insert spaces instead of tab character
set expandtab

" Set no backups
set nobackup
set nowritebackup
set noswapfile

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1"

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Navigate windows with auto-create if navigating at edge of windows
function! s:GotoNextWindow( direction )
  let l:prevWinNr = winnr()
  execute 'wincmd' a:direction
  return winnr() != l:prevWinNr
endfunction

function! s:JumpWithCreate( direction )
  if ! s:GotoNextWindow(a:direction)
    if a:direction == 'h'
      vsplit
    elseif a:direction == 'j'
      split
    elseif a:direction == 'k'
      split
    elseif a:direction == 'l'
      vsplit
    endif
    execute 'wincmd' a:direction
  endif
endfunction

nnoremap <silent> <C-h> :<C-u>call <SID>JumpWithCreate('h')<CR>
nnoremap <silent> <C-j> :<C-u>call <SID>JumpWithCreate('j')<CR>
nnoremap <silent> <C-k> :<C-u>call <SID>JumpWithCreate('k')<CR>
nnoremap <silent> <C-l> :<C-u>call <SID>JumpWithCreate('l')<CR>

" Resize split windows
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>

" Clear hilighted searches
noremap <esc> :noh<CR>

set autoread
au CursorHold * checktime
