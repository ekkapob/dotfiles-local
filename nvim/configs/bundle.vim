call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'

Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'

Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'

Plug 'dracula/vim', {'as': 'dracula'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'

Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'

Plug 'jiangmiao/auto-pairs'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

call plug#end()
