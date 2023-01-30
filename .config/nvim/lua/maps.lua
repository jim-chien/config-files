nnoremap <C-e> :vsp<CR>:terminal<CR>
nnoremap <C-E> :sp<CR>:terminal<CR>

tnoremap <esc> <C-\><C-N>

-- Prevent delete from overriding what's in the clipboard
nnoremap d "_d
vnoremap d "_d

-- Prevent x and the delete key from overriding what's in the clipboard.
noremap x "_x
noremap X "_x
noremap <Del> "_x
vnoremap x "_x
vnoremap X "_x
vnoremap <Del> "_x

-- Prevent pasting in visual from overriding what's in the clipboard
xnoremap p pgvy

nmap wq :wq <CR>
nmap <leader>s :w<CR>
nmap <leader>w :w<CR>

-- Windows
nmap sw <C-w>q

-- Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

-- Move window
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

-- Tab
nmap <leader>t :tabnew<CR>

-- Indentation
vmap < <gv
vmap > >gv

-- Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

-- Copy relative path of the current Buffer
nmap <leader>cp :let @*=expand("%")<CR>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

-- Search for selected text, forwards or backwards.
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
