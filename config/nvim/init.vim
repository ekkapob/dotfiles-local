set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

set nobackup
set nowritebackup
set noswapfile

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

call plug#begin()

Plug 'neomake/neomake'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'mattn/emmet-vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

call plug#end()

syntax on
colorscheme dracula

" Leader
let mapleader = " "

" Faster saving
noremap <Leader>w :up<CR>

" Faster quit
noremap <Leader>q :up<CR>:q<CR>

" Enter Explore faster
map <Leader>e :Explore<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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

nnoremap < <C-W><
nnoremap > <C-W>>
nnoremap + <C-W>+
nnoremap - <C-W>-

nnoremap <silent> <Leader><Esc> :nohlsearch<Bar>:echo<CR>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap S :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" Highlight trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

let g:deoplete#enable_at_startup = 1
let g:go_fmt_command = "goimports"
let g:go_def_mode = "gopls"

let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#unimported_packages = 1

" Run NeoMake on read and write operations
autocmd! BufReadPost,BufWritePost * Neomake

" Disable inherited syntastic
let g:syntastic_mode_map = {
  \ "mode": "passive",
  \ "active_filetypes": [],
  \ "passive_filetypes": [] }

let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1

let g:syntastic_go_checkers = ['golint', 'govet']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

set autoread
au FocusGained * :checktime
