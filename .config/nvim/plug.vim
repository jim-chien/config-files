call plug#begin("~/.vim/plugged")

    " Appearance
    Plug 'vim-airline/vim-airline'
    Plug 'haya14busa/is.vim'
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'overcache/NeoSolarized'

    " Utilities
    Plug 'sheerun/vim-polyglot'
    Plug 'ap/vim-css-color'
    Plug 'preservim/nerdtree'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-commentary'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}

    " Completion / linters / formatters
    Plug 'neoclide/coc.nvim',  {'branch': 'master', 'do': 'yarn install'}
    Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
    Plug 'honza/vim-snippets'

    " Git
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
call plug#end()
