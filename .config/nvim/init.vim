if(!exists('g:vscode'))
  runtime ./plug.vim
" Theming
  colorscheme palenight
  set background=dark
else
  set noloadplugins
endif
let g:mapleader=';'
set encoding=utf8
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set foldmethod=manual
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

" Prevent delete from overriding what's in the clipboard
nnoremap d "_d
vnoremap d "_d

" Prevent x and the delete key from overriding what's in the clipboard.
noremap x "_x
noremap X "_x
noremap <Del> "_x
vnoremap x "_x
vnoremap X "_x
vnoremap <Del> "_x

" Prevent pasting in visual from overriding what's in the clipboard
xnoremap p pgvy

nmap wq :wq <CR>
nmap <leader>s :w<CR>
nmap <leader>w :w<CR>
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

" Indentation
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Copy relative path of the current Buffer
nmap <leader>cp :let @*=expand("%")<CR>

if(!exists('g:vscode'))
  noremap <Up> <NOP>
  noremap <Down> <NOP>
  noremap <Left> <NOP>
  noremap <Right> <NOP>
endif

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
