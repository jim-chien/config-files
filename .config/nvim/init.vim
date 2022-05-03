runtime ./plug.vim
let g:mapleader=';'
set encoding=utf8
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set cursorline
set mouse=a
set number
set splitbelow splitright
set title
set wildmenu
set expandtab
set shiftwidth=2
set tabstop=2
set hlsearch
set incsearch
set smartcase
set ai
set si
set ttyfast
filetype plugin indent on
syntax on
set list
set listchars=tab:›\ ,space:·
" Finding files - Search down into subfolders
set path+=**
set wildmode=list:longest,list:full
set wildignore+=*node_modules/,*coverage/,*.o,*.obj,.git,*.rbc,*.pyc,__pycache__,*/tmp/*,*.so,*.swp,*.zip,*.db,*.sqlite,.DS_Store
" Theming
colorscheme palenight
set background=dark
" Use terminal background
highlight Normal guibg=none guifg=none

" True color if available
let term_program=$TERM_PROGRAM

" Check for conflicts with Apple Terminal app
if term_program !=? 'Apple_Terminal'
  set termguicolors
else
  if $TERM !=? 'xterm-256color'
    set termguicolors
  endif
endif

nnoremap <C-e> :vsp<CR>:terminal<CR>
nnoremap <C-E> :sp<CR>:terminal<CR>

tnoremap <esc> <C-\><C-N>

nnoremap d "_d
" Prevent x and the delete key from overriding what's in the clipboard.
noremap x "_x
noremap X "_x
noremap <Del> "_x

nmap qa :qa!<CR>
nmap qq :q!<CR>
nmap wq :wq <CR>
nmap <leader>s :w<CR>
" Windows
nmap sw <C-w>q
" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
" Move window
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

" Tab
nmap <leader>t :tabnew<CR>
nmap <leader>w :tabclose<CR>

" Indentation
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Copy relative path of the current Buffer
nmap <leader>cp :let @*=expand("%")<CR>
