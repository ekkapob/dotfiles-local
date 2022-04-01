for f in split(glob('~/.config/nvim/configs/*.vim'), '\n')
  exe 'source' f
endfor

" theme
let g:dracula_colorterm = 0
colorscheme dracula
syntax enable

" show trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" hybrid line numbers
set number
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" smart search with highlight
set ignorecase
set smartcase
set incsearch

let g:go_doc_keywordprg_enabled = 0

" set mouse selection excluding line numbers
set mouse+=a

" yank to copy to clipboard
set clipboard=unnamed
